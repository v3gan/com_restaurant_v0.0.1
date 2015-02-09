<?php
defined('_JEXEC') or die;

class RestaurantHelper
{
    /*
     * Essentially looks at component permissions for the groups that the user is in
     */
	public static function getActions($categoryId = 0)
	{
		$user	= JFactory::getUser();
		$result	= new JObject;

		if (empty($categoryId))
		{
			$assetName = 'com_restaurant';
			$level = 'component';
		}
		else
		{
			$assetName = 'com_restaurant.category.'.(int) $categoryId;
			$level = 'category';
		}

		$actions = JAccess::getActions('com_restaurant', $level);

		foreach ($actions as $action)
		{
			$result->set($action->name,	$user->authorise($action->name, $assetName));
		}

		return $result;
	}
    /*
     * creates a link to the default view (restaurants) and 
     * to the categories view (just a list of user defined categories)
     */
    public static function addSubmenu($vName='restaurants')
    {
        JHtmlSidebar::addEntry(JText::_('COM_RESTAURANT_SUBMENU_RESTAURANTS'),
            'index.php?option=com_restaurant&view=restaurants',$vName=='restaurants');
        JHtmlSidebar::addEntry(JText::_('COM_RESTAURANT_SUBMENU_CATEGORIES'),
            'index.php?option=com_categories&extension=com_restaurant',$vName=='categories');
        
        if($vName=='categories')
        {
            JToolbarHelper::title(JText::sprintf('COM_CATEGORIES_CATEGORIES_TITLE',
                JText::_('com_restaurant')),'restaurants-categories');
        }
        
        JHtmlSidebar::addEntry(JText::_('COM_RESTAURANT_SUBMENU_PREVIEW'),
            'index.php?option=com_restaurant&view=preview',$vName=='preview');
    }
    
}