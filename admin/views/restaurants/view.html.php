<?php
/*
 * name class like <component name>View<view name>
 * 
 * This is where all the toolbar buttons and the title for the view are defined.
 * It calls the model to get the data ready to give to the view.
 * 
 * $this->get() is a member of JViewLegacy::get which is a proxy 
 * to get* methods of the default model where * is populated with 
 * the value of the first parameter passed to get()
 * 
 */
defined('_JEXEC') or die;

class RestaurantViewrestaurants extends JViewLegacy
{
    /*
     * variable to store the array of data retrieved from the model
     */
	protected $items;
    /*
     * variable to store the column and direction of the sort
     */    
    protected $state;
    /*
     * variable to get a JPagination object for the data set.
     */
    protected $pagination;
    
    /*
     * called by default whenever the view is displayed
     */
	public function display($tpl = null)
	{
	    /*
         * get the array of data from the model for the tpl
         * calls JModelList.getItems
         */
		$this->items = $this->get('Items');
        /*
         * get the current state from the model for the tpl
         * contains the sort coulumn and direction
         * calls JModelLegacy.getState() (inherited by JModelList with no override)
         */
        $this->state = $this->get('State');
        
        RestaurantHelper::addSubmenu('restaurants');
        
        /*
         * error checking in case something goes wrong with the database query
         */
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}
        
		$this->addToolbar();
        
        /*
         * the sidbar will not show without this
         */
        $this->sidebar = JHtmlSidebar::render();
        
        /*
         * show the view
         */
		parent::display($tpl);
	}

    /*
     * adds buttons to the top of the view such as 'New', 'Edit', 'Options', ...
     */
	protected function addToolbar()
	{
	    //  other backend actions in <site_root>/administrator/includes/toolbar.php

		/*
         * check current user permissions (via the RestaruantHelper class in 
         * admin/helpers/restaurant.php) to determine which buttons to display
         */
		$canDo	= RestaurantHelper::getActions();

		/*
         * set up toolbar so that buttons can be added
         */
		$bar = JToolBar::getInstance('toolbar');
        
        $state = $this->get('State');
        
        /*
         * title is the text shown at the top of the view
         * uses JText() to display a language string
         */
		JToolbarHelper::title(JText::_('COM_RESTAURANT_MANAGER_RESTAURANTS'), '');
        
        /*
         * create a 'New' button
         * ?? in this case we are adding a new record to the 'restaurant' form
         */
		JToolbarHelper::addNew('restaurant.add');
        
        /*
         * edit button is used in conjunction with the checkbox next to
         * each row of data (user selects row and clicks edit)
         * check permission before allowing this
         */
		if ($canDo->get('core.edit'))
		{
			JToolbarHelper::editList('restaurant.edit');
		}
        
        if($canDo->get('core.edit.state'))
        {
            JToolbarHelper::publish('restaurants.publish','JTOOLBAR_PUBLISH',true);
            JToolbarHelper::unpublish('restaurants.unpublish','JTOOLBAR_UNPUBLISH',true);
            JToolbarHelper::archiveList('restaurants.archive');
            JToolbarHelper::checkin('restaurants.checkin'); 
        }
        
        if($state->get('filter.state') == -2 && $canDo->get('core.delete'))
        {
            JToolbarHelper::deleteList('','folios.delete','JTOOLBAR_EMPTY_TRASH');    
        }elseif ($canDo->get('core.edit.state'))
        {
            JToolBarHelper::trash('restaurants.trash');
        }
        
        /*
         * show option button if user is admin
         * shows parameters and permissions 
         */
		if ($canDo->get('core.admin'))
		{
			JToolbarHelper::preferences('com_restaurant');
		}
        
        JHtmlSidebar::setAction('index.php?option=com_restaurant&view=restaurants');
        
        JHtmlSidebar::addFilter(JText::_('JOPTION_SELECT_PUBLISHED'), 'filter.state', 
            JHtml::_('select.options',JHtml::_('jgrid.publishedOptions'),
                'value','text',$this->state->get('filter.state'),true));
	}
protected function getSortFields()
{
    return array('r.ordering'=>JText::_('JGRID_HEADING_ORDERING'),
        'r.pub_state'=>JText::_('JSTATUS'),
        'r.restaurant'=>JText::_('COM_RESTAURANT_HEADING_RESTAURANT'),
        'n.name'=>JText::_('COM_RESTAURANT_HEADING_NEIGHBORHOOD'),
        'r.phone'=>JText::_('COM_RESTAURANT_HEADING_PHONE'),
        'r.address1'=>JText::_('COM_RESTAURANT_HEADING_ADDRESS1'),
        'r.zip'=>JText::_('COM_RESTAURANT_HEADING_ZIP'),
        'r.display_logo'=>JText::_('COM_RESTAURANT_HEADING_DISPLAY_LOGO'),
        'r.website'=>JText::_('COM_RESTAURANT_HEADING_WEBSITE'),
        'r.blurb'=>JText::_('COM_RESTAURANT_HEADING_BLURB')
        );	
}
}