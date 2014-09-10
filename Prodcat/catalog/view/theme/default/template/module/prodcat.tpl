<div class="box">
  <div class="box-heading"><?php echo $heading_title . $descname; ?></div>
  <div class="box-content">
          <?php if ($viewgoods) { ?>
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      </div>
      <?php } ?>
    </div>
	  <?php } ?>
<?php if ($viewsub) { ?>
<?php if ($subcategories) { ?>
  <h2><?php echo $descname; ?></h2>
  <div class="category-list">
    <ul>
      <?php foreach ($subcategories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>"><span><?php echo $category['name']; ?></a></span></li>
      <?php } ?>
    </ul>  
  </div>
  <?php } ?>
  <?php } ?>
  <?php if ($viewdesc) { ?>
  <div class="category-info">
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
   <?php } ?>
  </div>
</div>