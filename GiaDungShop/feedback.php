<?php
require_once __DIR__ . "/autoload/autoload.php";
$con = mysqli_connect("localhost", "root", "", "webfast");
$data =
    [
        'name' => postInput("name"),
        'email' => postInput("email"),
        'content' => postInput("content")
    ];
$error = [];
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if ($data['name'] == '') {
        $error['name'] = "Bạn không được để trống tên !!!";
    }

    if ($data['email'] == '') {
        $error['email'] = "Bạn không được để trống email !!!";
    }

    if ($data['content'] == '') {
        $error['content'] = "Bạn không được để trống nội dung !!!";
    }

    //kiểm tra mảng error
    if (empty($error)) {
        $idinsert = $db->insert("feedback", $data);
        if ($idinsert > 0) {
            echo "<script>alert('Cảm ơn phản hồi của bạn.');location.reload()'</script>";
        } else {
        }
    }
}


?>
<?php require_once __DIR__ . "/layouts/header.php"; ?>

<section class="contact spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="contact__text">
                    <div class="section-title">
                        <span>Thông tin</span>
                        <h2>Liên hệ với chúng tôi</h2>
                        <p>Như bạn có thể mong đợi về một công ty bắt đầu với tư cách là nhà cung cấp hàng gia dụng chất lượng, chúng tôi rất chú ý.</p>
                    </div>
                    <ul>
                        <li>
                            <h4>Vĩnh Long</h4>
                            <p>41-26/6, 41 Trưng Nữ Vương, Phường 1, Vĩnh Long<br>+84-79-6874808</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="contact__form">
                    <form action="#" method="POST">
                        <div class="row">
                            <div class="col-lg-6">
                                <input type="text" placeholder="Họ tên" name="name" class="mb-0">
                                <?php if (isset($error['name'])) : ?>
                                    <p class="text-danger"><?php echo $error['name'] ?></p>
                                <?php endif ?>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" placeholder="Email" name="email" class="mb-0">
                                <?php if (isset($error['email'])) : ?>
                                    <p class="text-danger"><?php echo $error['email'] ?></p>
                                <?php endif ?>
                            </div>
                            <div class="col-lg-12 mt-3 mb-3">
                                <textarea placeholder="Lời nhắn" name="content" class="mb-0"></textarea>
                                <?php if (isset($error['content'])) : ?>
                                    <p class="text-danger text-left"><?php echo $error['content'] ?></p>
                                <?php endif ?>
                                <button type="submit" class="site-btn">Gửi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<?php require_once __DIR__ . "/layouts/footer.php"; ?>
