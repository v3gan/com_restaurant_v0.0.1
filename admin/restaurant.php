<?php
/*
\admin\restaurant.php
administrator entry point

*/
defined('_JEXEC') or die;

if (!JFactory::getUser()->authorise('core.manage', 'com_restaurant'))
{
    return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
}

/*
 * get the stylesheet for the component
 */
$document = JFactory::getDocument();
$cssFile = "./media/com_restaurant/css/site.stylesheet.css";
$document->addStylesheet($cssFile);
$jsFile = "./media/com_restaurant/js/default.js";
$document->addScript($jsFile);

//  Get an instance of the controller prefixed by Restaurant
//  the arguement to JControllerLegacy::getInstance is the name of the component
//  and will prefix all of the classes
$controller = JControllerLegacy::getInstance('Restaurant');

//  task input determines what the comopnent is going to do next
$input = JFactory::getApplication()->input;
$controller->execute($input->get('task'));

//  controller redirects to the next url
$controller->redirect();