   <!-- Footer Section Begin -->
   <footer class="footer">
     <div class="container">
       <div class="row">
         <div class="col-lg-3 col-md-6 col-sm-6">
           <div class="footer__about">
             <div class="footer__logo">
               <a href="#"><img src="img/footer-logo.png" alt=""></a>
             </div>
             <p>Khách hàng là trọng tâm trong mô hình kinh doanh độc đáo của chúng tôi.</p>
             <a href="#"><img src="img/payment.png" alt=""></a>
           </div>
         </div>
         
         <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
           <div class="footer__widget">
             <h6>Nhận Thông báo</h6>
             <div class="footer__newslatter">
               <p>Hãy là người đầu tiên biết về hàng mới về, giảm giá và khuyến mãi!</p>
               <form action="#">
                 <input type="text" placeholder="Email của bạn">
                 <button type="submit"><span class="icon_mail_alt"></span></button>
               </form>
             </div>
           </div>
         </div>
       </div>
       <div class="row">
         <div class="col-lg-12 text-center">
           <div class="footer__copyright__text">
             <p>Copyright ©
               <script>
                 document.write(new Date().getFullYear());
               </script>2025
               Mimi shop. All rights reserved.
             </p>
           </div>
         </div>
       </div>
     </div>
   </footer>
   <!-- Footer Section End -->

   <!-- Search Begin -->
   <div class="search-model">
     <div class="h-100 d-flex align-items-center justify-content-center">
       <div class="search-close-switch">+</div>
       <form class="search-model-form">
         <input name="keywork" class="keywork" id="search-input" placeholder="Tìm kiếm">
         <?php if (isset($_SESSION['error_s'])) : ?>
           {
           echo "<script>
             alert('<?php echo $_SESSION['error_s'];unset($_SESSION['error_s']); ?>');
             location.href = 'index.php'
           </script>";
           }
         <?php endif; ?>
       </form>
     </div>
   </div>
   <!-- Search End -->
   <!-- Js Plugins -->
   <script src="<?php echo base_url() ?>public/frontend/js/jquery-3.3.1.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/bootstrap.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/jquery.nice-select.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/jquery.nicescroll.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/jquery.magnific-popup.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/jquery.countdown.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/jquery.slicknav.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/mixitup.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/owl.carousel.min.js"></script>
   <script src="<?php echo base_url() ?>public/frontend/js/main.js"></script>
   <script src="http://www.myersdaily.org/joseph/javascript/md5.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   </body>

   </html>
   <script type="text/javascript">
     $(function() {
       $hidenitem = $(".hidenitem");
       $itemproduct = $(".item-product");
       $itemproduct.hover(function() {
         $(this).children(".hidenitem").show(100);
       }, function() {
         $hidenitem.hide(500);
       })
     })
     $(function() {
       $updatecart = $(".updatecart");
       $updatecart.click(function(e) {
         e.preventDefault();
         $qty = $(this).parents("tr").find("#qty").val();
         $key = $(this).attr("data-key");
         $.ajax({
           url: 'update.php',
           type: 'GET',
           data: {
             'qty': $qty,
             'key': $key
           },
           success: function(data) {
             alert('Thành công');
             location.href = 'giohang.php';
           }
         });
       })
     })
   </script>
   <script>
     function isNumberKey(evt) {
       var charCode = (evt.which) ? evt.which : evt.keyCode
       if (charCode > 31 && (charCode < 48 || charCode > 57))
         return false;
       return true;
     }
   </script>
