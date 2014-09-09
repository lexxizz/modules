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
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <?php $module_row = 0; ?>
								   <table id="module" class="list">
     

        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          
			<tr>
				<td><?php echo $text_cat; ?></td>
				<?$module['check'];?>
				<td>
				<?php if ($categories) { ?>
            <?php foreach ($categories as $category) { ?>
			   <?php if ($module['check'] == $category['category_id']) { ?>
                <div><input type="radio" name="prodcat_module[<?php echo $module_row; ?>][check]" value="<?php echo $category['category_id'];?>" checked> <?php echo $category['name']; ?>
				       <?php } else { ?>
					   <input type="radio" name="prodcat_module[<?php echo $module_row; ?>][check]" value="<?php echo $category['category_id'];?>" ><?php echo $category['name'];} ?><br>
            <?php } ?>
            <?php } ?>
			
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
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="<?php echo $module['sub_width']; ?>" size="3" />
							<input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="<?php echo $module['sub_height']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="80" size="3" />
							<input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="80" size="3" />
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
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
							<input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="80" size="3" />
							<input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="80" size="3" />
							  </tr>
							  <? } ?>
			<tr>
				<td><?php echo $text_num; ?></td>
				<? if(isset($module['limit'])) {?>
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3" />
				<? }else{?>
				<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="" size="3" />
				 </tr>
							  <? } ?>

          <tr>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
							  <tr>
            <td class="left"><select  name="prodcat_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
              </select>
			
            <td class="left"><select name="prodcat_module[<?php echo $module_row; ?>][position]">
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
               </select></td>
            <td class="left"><select name="prodcat_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
			  <td class="right"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
			   
          
           <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td></tr>	
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="4"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
	  	</tbody>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	
	html += '<tr>';
	html += '			<td><?php echo $text_cat; ?></td>';
		html += '		<td> ';
		 html += '<?php if ($categories) { ?> ';
      html += '      <?php foreach ($categories as $category) { ?>';
      html += '          <div><input type="radio" name="prodcat_module[<?php echo $module_row; ?>][check]" value="<?php echo $category['category_id'];?>"> <?php echo $category['name']; }?>';
        html += '    <?php } ?>';
		html += '	</div></td>';
         html += '   </tr>';
		html += ' <tr>';
		html += '		<td><?php echo $text_desc; ?></td>';
			html += '	<td><select name="prodcat_module[<?php echo $module_row; ?>][desc]">';
          html += '      <?php if ($module['desc']) { ?>';
          html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
          html += '      <option value="0"><?php echo $text_disabled; ?></option>';
          html += '      <?php } else { ?>';
          html += '      <option value="1"><?php echo $text_enabled; ?></option>';
          html += '      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
          html += '      <?php } ?>';
          html += '    </select> </td>';
          html += '  </tr>';
		html += '	<tr>';
              
			html += '	<td><?php echo $text_podcat; ?></td>';
		html += '		<td><select name="prodcat_module[<?php echo $module_row; ?>][podcat]">';
          html += '      <?php if ($module['podcat']) { ?>';
         html += '       <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
          html += '      <option value="0"><?php echo $text_disabled; ?></option>';
            html += '    <?php } else { ?>';
          html += '      <option value="1"><?php echo $text_enabled; ?></option>';
         html += '       <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
         html += '       <?php } ?>';
         html += '     </select>';
		html += '	  </td>';
         html += '   </tr>';
		html += '	<tr>';
		html += '		<td><?php echo $text_subwh; ?></td>';
		html += '		<? if(isset($module['sub_width'])) {?>';
		html += '		<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="<?php echo $module['sub_width']; ?>" size="3" />';
		html += '					<input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="<?php echo $module['sub_height']; ?>" size="3" />';
			html += '	<? }else{?>';
			html += '	<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_width]" value="80" size="3" />';
			html += '				<input type="text" name="prodcat_module[<?php echo $module_row; ?>][sub_height]" value="80" size="3" />';
			html += '				  </tr>';
			html += '				  <? } ?>';
			
			html += '<tr>';
			html += '	<td><?php echo $text_goods; ?></td>';
			html += '	<td><select name="prodcat_module[<?php echo $module_row; ?>][goods]">';
            html += '    <?php if ($module['goods']) { ?>';
            html += '    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
            html += '    <option value="0"><?php echo $text_disabled; ?></option>';
            html += '    <?php } else { ?>';
            html += '    <option value="1"><?php echo $text_enabled; ?></option>';
            html += '    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
            html += '    <?php } ?>';
            html += '  </select></td>';
            html += '</tr>';
			html += '<tr>';
			html += '	<td><?php echo $text_goodswh; ?></td>';
			html += '	<? if(isset($module['image_width'])) {?>';
			html += '	<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />';
			html += '				<input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />';
			html += '	<? }else{?>';
			html += '	<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_width]" value="80" size="3" />';
			html += '				<input type="text" name="prodcat_module[<?php echo $module_row; ?>][image_height]" value="80" size="3" />';
			html += '				  </tr>';
			html += '				  <? } ?>';
			html += '<tr>';
			html += '	<td><?php echo $text_num; ?></td>';
			html += '	<? if(isset($module['limit'])) {?>';
			html += '	<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="3" />';
			html += '	<? }else{?>';
			html += '	<td class="left"><input type="text" name="prodcat_module[<?php echo $module_row; ?>][limit]" value="1" size="3" />';
			html += '	 </tr>';
			html += '				  <? } ?>';
          html += '<tr>';
           html += ' <td class="left"><?php echo $entry_layout; ?></td>';
           html += ' <td class="left"><?php echo $entry_position; ?></td>';
           html += ' <td class="left"><?php echo $entry_status; ?></td>';
           html += ' <td class="right"><?php echo $entry_sort_order; ?></td>';
           html += ' <td></td>';
         html += ' </tr>';
	html += '  <tr>';
	html += '    <td class="left"><select name="prodcat_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="prodcat_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="prodcat_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="prodcat_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script> 

<?php echo $footer; ?>