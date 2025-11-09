<?php
require_once __DIR__ . '/autoload/autoload.php';

$id = intval(getInput('id'));
$cate = $db->fetchID("category", $id);

// Truy vấn sản phẩm theo danh mục
$sql = "SELECT p.*, pi.image as images 
        FROM product p
        LEFT JOIN product_images pi ON pi.product_id = p.id
        WHERE p.category_id = $id 
        GROUP BY p.id 
        ORDER BY p.id DESC";

$total = count($db->fetchsql($sql));

$p = isset($_GET['page']) ? $_GET['page'] : 1;

$product = $db->fetchJones("product", $sql, $total, $p, 12, true);

if (isset($product)) {
    $sotrang = $product['page'];
    unset($product['page']);
}
?>
<?php require_once __DIR__ . '/layouts/header.php'; ?>

<section class="shop spad">
    <div class="container">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">Danh mục</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">
                                            <ul class="nice-scroll" tabindex="1" style="overflow-y: hidden; outline: none;">
                                                <?php foreach ($categories as $c) : ?>
                                                    <li><a href="danh-muc.php?id=<?= $c['id'] ?>"><?= $c['name'] ?></a></li>
                                                <?php endforeach ?>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product List -->
            <div class="col-lg-9">
                <h4 class="mb-4">Danh mục: <?= htmlspecialchars($cate['name']) ?></h4>
                <div class="row">
                    <?php foreach ($product as $item) : ?>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<?= uploads() ?>product/<?= $item['images'] ?>" style="background-image: url('<?= uploads() ?>product/<?= $item['images'] ?>');">
                                    <ul class="product__hover">
                                        <li><a href="san_pham.php?id=<?= $item['id'] ?>"><img src="<?= base_url() ?>public/frontend/img/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <h6 class="pt-3"><a href="san_pham.php?id=<?= $item['id'] ?>" class="text-dark"><?= $item['name'] ?></a></h6>
                                <div class="product__item__text pt-1">
                                    <div class="rating">
                                        <i class="fa fa-star<?= ($item['rated'] < 1) ? '-o' : '' ?>"></i>
                                        <i class="fa fa-star<?= ($item['rated'] < 2) ? '-o' : '' ?>"></i>
                                        <i class="fa fa-star<?= ($item['rated'] < 3) ? '-o' : '' ?>"></i>
                                        <i class="fa fa-star<?= ($item['rated'] < 4) ? '-o' : '' ?>"></i>
                                        <i class="fa fa-star<?= ($item['rated'] < 5) ? '-o' : '' ?>"></i>
                                        <span class="ml-2"> <?= $item['comment'] ?> đánh giá </span>
                                    </div>
                                    <?php if ($item['sale'] > 0) : ?>
                                        <span class="mr-2">
                                            <strike class="sale"><?= formatPrice($item['price']) ?> đ</strike>
                                        </span>
                                    <?php endif ?>
                                    <h5 class="price"><?= formatPrice(formatSale($item['price'], $item['sale'])) ?> đ</h5>
                                </div>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
                <!-- Pagination -->
                <div class="row justify-content-center">
                    <div class="product__pagination d-flex justify-content-center">
                        <?php for ($i = 1; $i <= $sotrang; $i++) : ?>
                            <a class="<?= ($i == $p) ? 'active' : '' ?>" href="?id=<?= $id ?>&page=<?= $i; ?>"><?= $i; ?></a>
                        <?php endfor; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php require_once __DIR__ . '/layouts/footer.php'; ?>
