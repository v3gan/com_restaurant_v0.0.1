<?php
/*
\site\restaurant.php
front end entry point
*/
defined('_JEXEC') or die;
//  Get an instance of the controller prefixed by Restaurant
//  the argument to JControllerLegacy::getInstance is the name of the component
//  and will prefix all of the classes
$controller = JControllerLegacy::getInstance('Restaurant');

//  task input determines what the comopnent is going to do next
$controller->execute(JFactory::getApplication()->input->get('task'));

//  controller redirects to the next url
$controller->redirect();