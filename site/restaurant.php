<?php
defined('_JEXEC') or die;

$controller = JControllerLegacy::getInstance('Restaurant');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();