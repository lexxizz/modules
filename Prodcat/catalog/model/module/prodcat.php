<?php
class ModelModuleProdcat extends Model {
	public function getRandProducts($data = array()) {
		
//		$product_data = $this->cache->get('prodcat.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . (int)$data['limit']);
//		var_dump($product_data);
	//	if (!$product_data) {
		
			$sql = "SELECT p2c.product_id, p2c.category_id, cd.description, cd.name AS category, p.price, p.image, p.tax_class_id, ps.price AS special, p.model, pd.name, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p2c.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN ". DB_PREFIX . "product_description pd ON p2c.product_id = pd.product_id LEFT JOIN ". DB_PREFIX . "product_special ps ON p2c.product_id = ps.product_id LEFT JOIN ". DB_PREFIX . "product p ON p2c.product_id = p.product_id LEFT JOIN " . DB_PREFIX . "category_description cd ON p2c.category_id = cd.category_id WHERE p2c.category_id = '" . $data['category_id'] . "'";	
			$sql .= " GROUP BY p2c.product_id";
			$sql .= " ORDER BY " . $data['sort'] . " " . $data['order'];
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				
				if ($data['limit'] < 1) {
					$data['limit'] = 5;
				}		
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}			
			$product_data = array();					
			$query = $this->db->query($sql);	
			$product_data = $query->rows;

			
//			$this->cache->set('prodcat.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.' . (int)$data['limit'], $product_data);
	//	}
			return $product_data;
			

	}
}
?>
