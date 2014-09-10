<?php
class ModelModuleProdcat extends Model {
	public function getRandProducts($data = array()) {
		
			$sql = "SELECT " . DB_PREFIX . "product_to_category.product_id, " . DB_PREFIX . "product_to_category.category_id, " . DB_PREFIX . "category_description.description, " . DB_PREFIX . "category_description.name FROM " . DB_PREFIX . "product_to_category  LEFT JOIN " . DB_PREFIX . "category_description ON " . DB_PREFIX . "product_to_category.category_id = " . DB_PREFIX . "category_description.category_id WHERE " . DB_PREFIX . "product_to_category.category_id = '" . $data['category_id'] . "'";	
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
			return $query->rows;
			

	}
}
?>
