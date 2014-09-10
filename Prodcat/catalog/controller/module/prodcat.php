<?php  
class ControllerModuleProdcat extends Controller {
	protected function index($setting) {
		$this->language->load('module/prodcat');
		$this->load->model('catalog/product');
		$this->load->model('module/prodcat');

		$this->load->model('tool/image');
		
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
				$this->data['button_cart'] = $this->language->get('button_cart');
		 $this->data['viewsub'] = $setting['podcat'];
		 $this->data['viewdesc'] = $setting['desc'];
		 $this->data['viewgoods'] = $setting['goods'];
		 $this->data['category_id'] = $setting['check'];
		$this->data['subcategories'] = array();
		
			
			$results = $this->model_catalog_category->getCategories($setting['check']);
			
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);
							
				if(isset($this->request->get['path']) || (isset($this->request->get['path']) && isset($this->request->get['route'])))  {
				$this->data['subcategories'][] = array(
					'name'  => $result['name'] ,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id']),
					'thumb' => $this->model_tool_image->resize(($result['image']=='' ? 'no_image.jpg' : $result['image']), $setting['sub_width'], $setting['sub_height'])
				);
				}else{
					$this->data['subcategories'][] = array(
					'name'  => $result['name'] ,
					'href'  => $this->url->link('product/category', 'path=' . $result['category_id']),
					'thumb' => $this->model_tool_image->resize(($result['image']=='' ? 'no_image.jpg' : $result['image']), $setting['sub_width'], $setting['sub_height']) 
				);
				}
			}

		$this->data['products'] = array();
		
		$data = array(
			'category_id' => $setting['check'],
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_module_prodcat->getRandProducts($data);
		$this->data['description']=html_entity_decode($results['0']['description'], ENT_QUOTES, 'UTF-8');
		$this->data['descname']=html_entity_decode($results['0']['name'], ENT_QUOTES, 'UTF-8');

		foreach ($results as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}			
		
		foreach ($product_data as $result) {
		if ($result !== false){
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
		}
	


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/prodcat.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/prodcat.tpl';
		} else {
			$this->template = 'default/template/module/prodcat.tpl';
		}
	//	if(((($this->data['layout_routes']['0']['route']) == $this->request->get['route']) && $setting['goods']) ||  ((($this->data['layout_routes']['0']['route']) == $this->request->get['route']) && (!isset($this->request->get['path'])) && $setting['goods']) || ( (($this->data['layout_routes']['0']['route']) == $this->request->get['route']) && $setting['goods'])){
		$this->render();
	}
	}
	
//}
?>