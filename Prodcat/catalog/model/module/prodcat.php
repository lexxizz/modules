<?php
class ModelModuleProdcat extends Model {
	public function getRandProducts($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		$cache = md5(http_build_query($data));
		
			$sql = "SELECT product_id FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . $data['category_id'] . "'";	
			$sql .= " GROUP BY product_id";
			$sql .= " ORDER BY Rand()";
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}		
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}			
			$product_data = array();					
			$query = $this->db->query($sql);		
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}			
		return $product_data;
	}
	public function getLayoutRoutes($layout_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE layout_id = '" . (int)$layout_id . "'");
		
		return $query->rows;
	}
	public function getCatDesc($category_id) {
		$query = $this->db->query("SELECT description, name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . $category_id . "'");
		return $query->rows;
	}
}
?>
