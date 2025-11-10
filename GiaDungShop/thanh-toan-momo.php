<?php
require_once __DIR__ . "/autoload/autoload.php";

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

header('Content-type: text/html; charset=utf-8');

/**
 * Gửi yêu cầu POST bằng cURL
 */
function execPostRequest($url, $data)
{
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt(
        $ch,
        CURLOPT_HTTPHEADER,
        array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data)
        )
    );
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);

    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}

// ✅ Kiểm tra giỏ hàng có tồn tại hay không
$carts = $_SESSION['carts'] ?? [];
if (empty($carts)) {
    echo "<h3>❌ Giỏ hàng trống. Không thể thanh toán.</h3>";
    exit();
}

// ✅ Tính tổng tiền
$price = 0;
foreach ($carts as $item) {
    $price += $item['qty'] * $item['price'];
}

// ✅ Nếu tổng tiền = 0 thì dừng luôn
if ($price <= 0) {
    echo "<h3>❌ Không thể thanh toán: Tổng tiền không hợp lệ.</h3>";
    exit();
}

// MoMo Test endpoint
$endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";

$partnerCode = 'MOMOBKUN20180529';
$accessKey   = 'klm05TvNBzhg7h7j';
$secretKey   = 'at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa';

$orderInfo   = "Thanh toán qua MoMo";
$amount      = $price;
$orderId     = time() . "";
$requestId   = time() . "";
$requestType = "payWithATM";
$redirectUrl = "http://localhost/GiaDungShop/response-thanh-toan.php";
$ipnUrl      = "http://localhost/GiaDungShop/response-thanh-toan.php";
$extraData   = "";

// Tạo chuỗi để ký
$rawHash = "accessKey=" . $accessKey
    . "&amount=" . $amount
    . "&extraData=" . $extraData
    . "&ipnUrl=" . $ipnUrl
    . "&orderId=" . $orderId
    . "&orderInfo=" . $orderInfo
    . "&partnerCode=" . $partnerCode
    . "&redirectUrl=" . $redirectUrl
    . "&requestId=" . $requestId
    . "&requestType=" . $requestType;

$signature = hash_hmac("sha256", $rawHash, $secretKey);

// Gói dữ liệu gửi MoMo
$data = array(
    'partnerCode' => $partnerCode,
    'partnerName' => "Test",
    'storeId' => "MomoTestStore",
    'requestId' => $requestId,
    'amount' => $amount,
    'orderId' => $orderId,
    'orderInfo' => $orderInfo,
    'redirectUrl' => $redirectUrl,
    'ipnUrl' => $ipnUrl,
    'lang' => 'vi',
    'extraData' => $extraData,
    'requestType' => $requestType,
    'signature' => $signature
);

$result = execPostRequest($endpoint, json_encode($data));
$jsonResult = json_decode($result, true);

// ✅ Kiểm tra phản hồi từ MoMo
if (isset($jsonResult['payUrl'])) {
    header('Location: ' . $jsonResult['payUrl']);
    exit();
} else {
    echo "<h3>❌ Lỗi tạo thanh toán MoMo</h3>";
    echo "<pre>";
    var_dump($jsonResult);
    echo "</pre>";
}
