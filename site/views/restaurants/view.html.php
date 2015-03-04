<?php
defined('_JEXEC') or die;

/**
 * 
 */
class RestaurantViewRestaurants extends JViewLegacy {
	
    protected $items;
	public function display($tpl = null) {
		$this->items = $get('Items');
        if(count($errors = $this->get('Errors')))
        {
            JError::raiseError(500, implode("/n",$errors));
            return false;
        }
        parent::display($tpl);
	}
}
