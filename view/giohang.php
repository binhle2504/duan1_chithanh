<div class="view-cart">
    <div class="view-cart-left">
        <div class="order-progress">
            <div class="progress-dot">
                <span class="dot dot-line-active"></span>
                <span class="dot-name">Giỏ hàng</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-dot">
                <span class="dot"></span>
                <span class="dot-name">Đặt hàng</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-dot">
                <span class="dot"></span>
                <span class="dot-name">Thanh toán</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-dot">
                <span class="dot"></span>
                <span class="dot-name">Hoàn thành đơn</span>
            </div>
        </div>
        <div class="cart-content block">
            <!-- <h2 class="cart-content-title">Giỏ hàng của bạn có <span class="count-product-red"><?= $soluongtronggiohang ?> sản phẩm</span></h2> -->
            <h2 class="cart-content-title">Giỏ hàng của bạn</h2>

            <table class="cart-detail">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>ẢNH</th>
                        <th>THÔNG TIN</th>
                        <th>GIẢM GIÁ</th>
                        <th>SỐ LƯỢNG</th>
                        <th>THÀNH TIỀN</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $tonggiohang = 0;
                    $soluongtronggiohang = 0;
                    $tongtiengoc = 0;
                    $tongsosanpham = 0;
                    foreach ($_SESSION["mycart"] as $item) {
                        $tonggiohang += $item[10];
                        $tongtiengoc += $item[12];
                        $tongsosanpham += $item[8];
                    ?>
                        <tr>
                            <td><?= $soluongtronggiohang + 1 ?></td>
                            <td><img src="./upload/<?= $item[4] ?>" alt=""></td>
                            <td class="product-info">
                                <p class="product-name"><?= $item[1] ?></p>
                                <span class="color-product">Màu: <?= $item[7] ?></span><br>
                                <span class="size-product">Size: <?= $item[6] ?></span>
                            </td>
                            <td>-<?= number_format($item[11], 0, ",", ".") ?>đ</td>
                            <td>
                                <div class="flex items-center gap-1">
                                    <span class="decrease-btn-detail bg-gray-200 rounded-[50%] w-8 h-8 flex items-center justify-center font-black text-l"><i class="fa-solid fa-caret-down text-xl cursor-pointer" style="color: #f8303a;"></i></span>
                                    <!-- <input type="number"
                                    class="border-solid text-center border-[1px] border-gray-300 rounded-sm w-[80px] pl-[16px] py-2 h-10"
                                    id="number-display" name="soluongmua" value="<?= $item[8] ?>" max="<?= $item[9] ?>"
                                    min="1" required oninput="updateTotal(this)"> -->
                                    <input type="number" class="border-solid text-center border-[1px] border-gray-300 rounded-sm w-[80px] pl-[16px] py-2 h-10" id="number-display" name="soluongmua" value="<?= $item[8] ?>" max="<?= $item[9] ?>" min="1" required oninput="updateTotal(this); updateTotalProducts();">

                                    <span class="increase-btn-detail bg-gray-200 rounded-[50%] w-8 h-8 flex items-center justify-center font-black text-l"><i class="fa-solid fa-caret-up text-xl cursor-pointer" style="color: #f8303a;"></i></span>
                                </div>
                            </td>



                            <!-- thay doi cho nay nha khanh -->
                            <td class="unit-price" style="display: none"><?= $item[10] ?></td>
                            <td class="total-price" data-unit-price="<?= $item[10] ?>">
                                <?php echo number_format($item[10], 0, ",", ".") ?>đ
                            </td>
                            <!-- thay doi cho nay nha khanh -->



                            <td><a class="delete-btn" href="index.php?act=xoagiohang&id=<?= $soluongtronggiohang ?>"><i class="fa-regular fa-trash-can trash-icon"></i></a></td>
                        </tr>
                    <?php
                        $soluongtronggiohang++;
                    }
                    ?>
                    <!-- thay doi cho nay nua nha khanh  -->
                    <tr class="font-bold text-2xl">
                        <td colspan="6">Tổng giá trị giỏ hàng</td>
                        <td class="text-red-500"><?= number_format($tonggiohang, 0, ",", ".") ?>đ</td>
                    </tr>
                    <!-- thay doi cho nay nua nha khanh  -->

                    <?php
                    $_SESSION["soluongtronggiohang"] = $soluongtronggiohang;
                    ?>
                </tbody>
            </table>

            <div class="mt-10">
                <a href="index.php?act=danhsachsanpham" class="bg-green-500 text-white font-semibold text-lg px-5 py-4 rounded-md duration-200 hover:opacity-80 ">Tiếp
                    tục mua hàng</a>
                <a href="index.php?act=xoagiohang" class="delete-btn ml-5 bg-red-500 text-white font-semibold text-lg px-5 py-4 rounded-md duration-200 hover:opacity-80 ">Xoá
                    tất cả</a>
            </div>
        </div>
    </div>
    <div class="view-cart-right">
        <div class="cart-total">
            <h2 class="cart-total-title">Tổng tiền giỏ hàng</h2>
            <div class="cart-total-info">
                <!-- <div class="info-wapper">
                    <span class="info-name">Tổng sản phẩm</span> <span class="info-number"><?= $tongsosanpham ?></span>
                </div> -->
                <div class="info-wapper">
                    <span class="info-name">Tổng sản phẩm</span>
                    <span class="info-number" id="total-products"><?= $tongsosanpham ?></span>
                </div>
                <div class="info-wapper">
                    <span class="info-name">Tổng tiền gốc</span> <span class="info-number"><?= number_format($tongtiengoc, 0, ",", ".") ?>đ</span>
                </div>
                <div class="info-wapper">
                    <span class="info-name">Thành tiền sau chiết khấu</span> <span class="info-number"><?= number_format($tonggiohang, 0, ",", ".") ?>đ</span>
                </div>
                <div class="info-wapper">
                    <?php
                    if ($tonggiohang >= 500000) {
                        echo '<span class="info-name">Phí vận chuyển</span> <span class="info-number">0 VNĐ</span>';
                    } else {
                        echo '<span class="info-name">Phí vận chuyển</span> <span class="info-number">50.000 VNĐ</span>';
                    }
                    ?>
                </div>
                <?php
                if ($tonggiohang >= 500000) {
                    echo '<p class="free-ship"><i class="fa-solid fa-circle-check"></i> Đơn hàng của bạn được miễn phí ship</p>';
                } else {
                    echo '<p class="no-ship"><i class="fa-solid fa-triangle-exclamation"></i> Miễn phí ship với đơn hàng trên 500.000 VNĐ</p>';
                }
                ?>
                <?php
                if (isset($_SESSION["mycart"]) && $_SESSION["mycart"] != []) {
                    echo '<a href="index.php?act=xacnhandonhang" class="submit-btn">Đặt hàng</a>';
                } else {
                    echo '<a href="#" class="submit-btn">Đặt hàng</a>';
                }
                ?>

            </div>
        </div>
    </div>
</div>


<!-- them scrip -->
<script>
    function updateTotal(inputElement) {
        var row = inputElement.closest("tr");
        var unitPrice = parseFloat(row.querySelector(".unit-price").textContent);
        var quantity = parseFloat(inputElement.value);
        var totalPriceElement = row.querySelector(".total-price");

        if (!isNaN(unitPrice) && !isNaN(quantity)) {
            var newTotalPrice = unitPrice * quantity;
            totalPriceElement.textContent = newTotalPrice.toLocaleString("vi-VN") + "đ";
        }
    }
</script>