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
		
        $user       = JFactory::getUser();
        $userId     = $user->get('id');
        $isNew      = ($this->item->restaurant_location_id == 0);
        $canDo      = RestaurantHelper::getActions($this->item->catid, 0);
        
        JToolbarHelper::title(JText::_('COM_RESTAURANT_MANAGER_RESTAURANT'), '');
        
        if ($canDo->get('core.edit')||(count($user->getAuthorisedCategories('com_restaurant', 'core.create'))))
        {
            JToolbarHelper::apply('restaurant.apply');
            JToolbarHelper::save('restaurant.save');
        }
        if (count($user->getAuthorisedCategories('com_restaurant', 'core.create'))){
            JToolbarHelper::save2new('restaurant.save2new');
        }
        // If an existing item, can save to a copy.
        if (!$isNew && (count($user->getAuthorisedCategories('com_restaurant', 'core.create')) > 0))
        {
            JToolbarHelper::save2copy('restaurant.save2copy');
        }

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