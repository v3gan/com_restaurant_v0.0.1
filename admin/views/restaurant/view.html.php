<?php
defined('_JEXEC') or die;

/*
 * named like <component name>View<view name>
 */
class RestaurantViewRestaurant extends JViewLegacy
{
    /*
     * store data retrieved from the model
     */
	protected $item;
    
    /*
     * used to build the form
     */
	protected $form;
    
    /*
     * called by default whenever this view is displayed
     */
	public function display($tpl = null)
	{
	    /*
         * load data from the model
         */
		$this->item	= $this->get('Item');
        /*
         * build the JForm
         */
		$this->form	= $this->get('Form');

        /*
         * check for problems with the model
         * such as a field missing from the database table
         */
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}

		$this->addToolbar();
		parent::display($tpl);
	}

	protected function addToolbar()
	{
	    /*
         * hide the main menu so that links to other views are hidden
         */
		JFactory::getApplication()->input->set('hidemainmenu', true);
        
        /*
         * title at the top of the page
         */
		JToolbarHelper::title(JText::_('COM_RESTAURANT_MANAGER_RESTAURANT'), '');

        /*
         * save button
         */
		JToolbarHelper::save('restaurant.save');
		
        /*
         * shows cancel if record is new or close if editing
         */
		if (empty($this->item->id))
		{
			JToolbarHelper::cancel('restaurant.cancel');
		}
		else
		{
			JToolbarHelper::cancel('restaurant.cancel', 'JTOOLBAR_CLOSE');
		}
	}
}