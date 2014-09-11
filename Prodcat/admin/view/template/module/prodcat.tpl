<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="rf" id="form">
	  <div align="right" class="buttons"><a class="button but disabled"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button disabled"><?php echo $button_cancel; ?></a></div>
         <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add" onclick="addModule();" style="cursor: pointer;"><?php echo $button_add_menu; ?>&nbsp;<img src="view/image/add.png" /></span> 
		</div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <div id="language-<?php echo $module_row; ?>" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" style="border-bottom: 1px solid #DDDDDD;">
          </div>
          <?php } ?>
        <table class="form">
			<tr>
				<td><?php echo $text_cat; ?></td>
				<td>
				<?php if ($categories) { ?>
				<select  name="prodcat_module[<?php echo $module_row; ?>][check]">
            <?php foreach ($categories as $category) { ?>
			   <?php if ($module['check'] == $category['category_id']) { ?>
			   <option value="<?php echo $category['category_id'];?>" selected="selected"><?php echo $category['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $category['category_id'];?>"><?php echo $category['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
			 </select>
			</div></td>
            </tr>
			<tr>
				<td><?php echo $text_desc; ?></td>
				<td><select name="prodcat_module[<?php echo $module_row; ?>][desc]">
                <?php if ($module['desc']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select> </td>
            </tr>
			<tr>
              
				<td><?php echo $text_podcat; ?></td>
				<td><select name="prodcat_module[<?php echo $module_row; ?>][podcat]">
                <?php if ($module['podcat']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
			  </td>
            </tr>
			<tr>
				<td><?php echo $text_subwh; ?></td>
				<? if(isset($module['sub_width'])) {?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="<?php echo $module['sub_width']; ?>" size="3" />
							<input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="<?php echo $module['sub_height']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="80" size="3" />
							<input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="80" size="3" />
							  </tr>
							  <? } ?>
			<tr>
				<td><?php echo $text_goods; ?></td>
				<td><select name="prodcat_module[<?php echo $module_row; ?>][goods]">
                <?php if ($module['goods']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            </tr>
			<tr>
				<td><?php echo $text_goodswh; ?></td>
				<? if(isset($module['image_width'])) {?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
							<input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="80" size="3" />
							<input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="80" size="3" />
							  </tr>
							  <? } ?>
			<tr>
				<td><?php echo $text_num; ?></td>
				<? if(isset($module['limit'])) {?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" class="rfield" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="" size="3" />
				 </tr>
							  <? } ?>
			<select  name="prodcat_module[<?php echo $module_row; ?>][prodsorts]">
            <?php foreach ($sorts as $sorts) { ?>
			   <?php if ($sorts['value'] == $module[prodsorts]) { ?>
			   <option value="<?php echo $sorts['value'];?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['value'];?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>

			 </select>
        </table>

        <table id="module" class="list">
        <thead>
            <tr>
                <td class="left"><?php echo $entry_layout; ?></td>
                <td class="left"><?php echo $entry_position; ?></td>
                <td class="left"><?php echo $entry_status; ?></td>
                <td class="left"><?php echo $entry_sort_order; ?></td>   
            </tr>
        </thead>
        <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
                <td class="left">
                    <select name="prodcat_module[<?php echo $module_row; ?>][layout_id]">
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    </select>
                </td>
                <td class="left">
                    <select name="prodcat_module[<?php echo $module_row; ?>][position]">
                    <?php if ($module['position'] == 'content_top') { ?>
                    <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                    <?php } else { ?>
                    <option value="content_top"><?php echo $text_content_top; ?></option>
                    <?php } ?> 
                    <?php if ($module['position'] == 'content_bottom') { ?>
                    <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                    <?php } else { ?>
                    <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                    <?php } ?>
                    <?php if ($module['position'] == 'column_left') { ?>
                    <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                    <?php } else { ?>
                    <option value="column_left"><?php echo $text_column_left; ?></option>
                    <?php } ?>
                    <?php if ($module['position'] == 'column_right') { ?>
                    <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                    <?php } else { ?>
                    <option value="column_right"><?php echo $text_column_right; ?></option>
                    <?php } ?>
                    </select>
                </td>
                <td class="left">
                    <select name="prodcat_module[<?php echo $module_row; ?>][status]">
                    <?php if ($module['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                    </select>
                </td>     
                <td class="left">
				    <input type="text" name="prodcat_module[<?php echo $module_row; ?>][sort_order]" value="" size="3" />
				</td>
            </tr>
        </tbody>
        </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '  <div id="language-' + module_row + '" class="htabs">';
    <?php foreach ($languages as $language) { ?>
    html += '    <a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
    <?php } ?>
	html += '  </div>';

	<?php foreach ($languages as $language) { ?>
	html += '    <div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>" style="border-bottom: 1px solid #DDDDDD;">';
	html += '    </div>';
	<?php } ?>

	html += '  <table class="form">';
	html += '<tr>';
	html += '			<td><?php echo $text_cat; ?></td>';
			  	html += '	<td><select name="prodcat_module[' + module_row + '][check]">';
      html += '      <?php foreach ($categories as $category) { ?>';
      html += '   <option value="<?php echo $category['category_id'];?>" selected="selected"><?php echo $category['name']; ?></option>   ';
        html += '    <?php } ?>';

         html += '   </tr>';
		html += ' <tr>';
		html += '		<td><?php echo $text_desc; ?></td>';
			html += '	<td><select name="prodcat_module[' + module_row + '][desc]">';
          html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
          html += '      <option value="0"><?php echo $text_disabled; ?></option>';
          html += '    </select> </td>';
          html += '  </tr>';
		html += '	<tr>';
              
			html += '	<td><?php echo $text_podcat; ?></td>';
		html += '		<td><select name="prodcat_module[' + module_row + '][podcat]">';
         html += '       <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
          html += '      <option value="0"><?php echo $text_disabled; ?></option>';
         html += '     </select>';
		html += '	  </td>';
         html += '   </tr>';
		html += '	<tr>';
		html += '		<td><?php echo $text_subwh; ?></td>';
			html += '	<td class="left"><input type="text" class="rfield" name="prodcat_module[' + module_row + '][sub_width]" value="80" size="3" />';
			html += '				<input type="text" class="rfield" name="prodcat_module[' + module_row + '][sub_height]" value="80" size="3" />';
			html += '				  </tr>';

			
			html += '<tr>';
			html += '	<td><?php echo $text_goods; ?></td>';
			html += '	<td><select name="prodcat_module[' + module_row + '][goods]">';

            html += '    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
            html += '    <option value="0"><?php echo $text_disabled; ?></option>';


    html += '  </select></td>';
    html += '</tr>';
	html += '<tr>';
	html += '	<td><?php echo $text_goodswh; ?></td>';



	html += '	<td class="left"><input type="text" class="rfield" name="prodcat_module[' + module_row + '][image_width]" value="80" size="3" />';
	html += '				<input type="text" class="rfield" name="prodcat_module[' + module_row + '][image_height]" value="80" size="3" />';
	html += '				  </tr>';

	html += '<tr>';
	html += '	<td><?php echo $text_num; ?></td>';


	html += '	<td class="left"><input type="text" class="rfield" name="prodcat_module[' + module_row + '][limit]" value="1" size="3" />';
	html += '	 </tr>';
	html += '  </table>'; 
	
	html += '  <table id="module" class="list"><thead><tr>';
	html += '    <td class="left"><?php echo $entry_layout; ?></td>';
	html += '    <td class="left"><?php echo $entry_position; ?></td>';
	html += '    <td class="left"><?php echo $entry_status; ?></td>';
	html += '    <td class="left"><?php echo $entry_sort_order; ?></td>';
	html += '   </tr></thead>';
	html += '   <tbody id="module-row' + module_row + '"><tr><td class="left">';
	html += '    <select name="prodcat_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout["layout_id"]; ?>"><?php echo $layout["name"]; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    <td class="left"><select name="prodcat_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="prodcat_module[' + module_row + '][status]">';
	html += '      <option value="1"><?php echo $text_enabled; ?></option>';
	html += '      <option value="0"><?php echo $text_disabled; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="prodcat_module[' + module_row + '][sort_order]" value="" size="5" /></td>';
	html += '   </tr></tbody></table>';
	html += '</div>';
	
	$('#form').append(html);
	
	$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$(document).ready(function() {
    $(".form tr:even").css("background-color", "#F6F6F6");
    });
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<script type="text/javascript"><!--
    $(document).ready(function() {
    $(".form tr:even").css("background-color", "#F6F6F6");
});
//--></script>
<script type="text/javascript">
(function( $ ){

$(function() {

  $('.rf').each(function(){
    // Объявляем переменные (форма и кнопка отправки)
	var form = $(this),
        btn = form.find('.but');

    // Добавляем каждому проверяемому полю, указание что поле пустое
	form.find('.rfield').addClass('empty_field');

    // Функция проверки полей формы
    function checkInput(){
      form.find('.rfield').each(function(){
        if(($(this).val() != '') && !(/[^0-9]/.test($(this).val()))){
          // Если поле не пустое удаляем класс-указание
		$(this).removeClass('empty_field');
        } else {
          // Если поле пустое добавляем класс-указание
		$(this).addClass('empty_field');
        }
      });
    }

    // Функция подсветки незаполненных полей
    function lightEmpty(){
      form.find('.empty_field').css({'border-color':'#d8512d'});
      // Через полсекунды удаляем подсветку
      setTimeout(function(){
        form.find('.empty_field').removeAttr('style');
      },500);
    }

    // Проверка в режиме реального времени
    setInterval(function(){
      // Запускаем функцию проверки полей на заполненность
	  checkInput();
      // Считаем к-во незаполненных полей
      var sizeEmpty = form.find('.empty_field').size();
      // Вешаем условие-тригер на кнопку отправки формы
      if(sizeEmpty > 0){
        if(btn.hasClass('disabled')){
          return false
        } else {
          btn.addClass('disabled')
        }
      } else {
        btn.removeClass('disabled')
      }
    },500);

    // Событие клика по кнопке отправить
    btn.click(function(){
      if($(this).hasClass('disabled')){
        // подсвечиваем незаполненные поля и форму не отправляем, если есть незаполненные поля
		lightEmpty();
        return false
      } else {
        // Все хорошо, все заполнено, отправляем форму
        form.submit();
      }
    });
  });
});

})( jQuery ); 
</script> 
<?php echo $footer; ?>