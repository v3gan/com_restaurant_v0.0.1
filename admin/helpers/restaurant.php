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
}