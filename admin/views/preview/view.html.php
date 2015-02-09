<?php
defined('_JEXEC') or die;
class RestaurantViewPreview extends JViewLegacy
{
    protected $items;
    
    public function display($tpl=null)
    {
        $this->items = $this->get('Items');
        RestaurantHelper::addSubmenu('preview');
        
        if (count($errors = $this->get('Errors'))) {
            JError::raiseError(500, implode("\n", $errors));
            return false;
        }
        
        $this->addToolbar();
        $this->sidebar = JHtmlSidebar::render();
        parent::display($tpl);
    }
    
    protected function addToolbar()
    {
        $state = $this->get('State');
        $cando = RestaurantHelper::getActions();
        $bar = JToolbar::getInstance('toolbar');
        JToolbarHelper::back('COM_RESTAURANT_BUTTON_BACK','index.php?option=com_restaurant');
    }
}
