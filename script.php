<?php
defined('_JEXEC') or die;
/*
 * run when component is installed, uninstalled, or updated
 * also before and after installation
 */
class com_restaurantInstallerScript
{
    /*
     * redirects to default view of component
     */
	function install($parent)
	{
		//$this->createSampleImages();
		$parent->getParent()->setRedirectURL('index.php?option=com_restaurant');
	}

	function uninstall($parent)
	{
		echo '<p>' . JText::_('COM_RESTAURANT_UNINSTALL_TEXT') . '</p>';
	}

	function update($parent)
	{
		//$this->createSampleImages();
		echo '<p>' . JText::_('COM_RESTAURANT_UPDATE_TEXT') . '</p>';
	}

	function preflight($type, $parent)
	{
		echo '<p>' . JText::_('COM_RESTAURANT_PREFLIGHT_' . $type . '_TEXT') . '</p>';
	}

	function postflight($type, $parent)
	{
		echo '<p>' . JText::_('COM_RESTAURANT_POSTFLIGHT_' . $type . '_TEXT') . '</p>';
	}
}