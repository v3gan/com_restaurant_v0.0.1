<?php
defined('_JEXEC') or die;

class RestaurantControllerPreview extends JControllerAdmin
{
    /**
     * returns the model
     * @param   prefix  <component name>Model
     * @param   name    <edit view name>
     */
    public function getModel($name = 'Preview', $prefix = 'PreviewModel', $config = array('ignore_request' => true))
    {
        $model = parent::getModel($name, $prefix, $config);
        return $model;
    }
    
}