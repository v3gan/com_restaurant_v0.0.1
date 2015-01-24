<?php
// No direct access
defined('_JEXEC') or die('Restricted access');
 
jimport('joomla.form.formfield');
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');
 
 /**
  * neighborhood form field class
*/
class JFormFieldNeighborhoodList extends JFormFieldList
{
	/**
 	 * field type
 	 * @var string
 	 */
 	protected $type = 'NeighborhoodList';
	
	protected function getOptions()
	{
		$options = array();

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select('id As value, name As text')
			->from('#__rl_neighborhood')
			->order('name ASC');
		$db->setQuery($query);

		try
		{
			$options = $db->loadObjectList();
		}
		catch (RuntimeException $e)
		{
			JError::raiseWarning(500, $e->getMessage());
		}

        // Put "Select an option" on the top of the list.
		array_unshift($options, JHtml::_('select.option', '0', JText::_('Select an option')));

		return array_merge(parent::getOptions(), $options);
	}
	/*
	public function getLabel() {
		// code that returns HTML that will be shown as the label
	}
 
	public function getInput() {
		// code that returns HTML that will be shown as the form field
	}
	*/
}