<?php
/*
\admin\controller.php
general controller

When no task is given in the request variables, the default task will be executed. It's the display task by default. The JControllerLegacy class has such a task. In our example, it will display a view named restaurants.

So with task simply a public function display() of JControllerLegacy is refered to.

A Tip!
you could call another function aside from display() by using an URL like this one:
http://localhost/veganpittsburgh.org/index.php?option=com_restaurant&task=insert\
This would try to call a function insert() of our controller (which we would actually have to implement in HelloWorldController ).

*/
defined('_JEXEC') or die;

class restaurantController extends JControllerLegacy
{
    /*
    * this overrides JControllerLegacy
    *
     * The default view for the display method.
     * Required if the view name is different from the component name 
     * (view = 'restaurants' vs component = 'restaurant')
     * 
     * @var    string
     * @since  12.2
     */
    protected $default_view = 'restaurants';
    
    /**
     * display task
     * this is the first default function that is called if no specific task is executed
     * from the entry point
     *
     * @return void
     */
    public function display($cachable = false, $urlparams = false)
    {
        /*
         *  this file is used to check user permission to perform a task
         * 
        */    
        require_once JPATH_COMPONENT.'/helpers/restaurant.php';
        
        /* 
         * get variables from the url to determine view and layout to load
         * default is 'restaurants' view and 'default' layout while:
         *  index.php?option=com_restaurant&view=restaurant&layout=edit
         * would load the 'restaurant' view and 'edit' layout
        */
        $view   = $this->input->get('view', 'restaurants');
        $layout = $this->input->get('layout', 'default');
        $id     = $this->input->getInt('id');

        /*
         * error checking
         * do not allow access to edit form directly
         * ??com_restaurant.edit.restaurant is populated from the 'restaurants' view somehow
         */
        if ($view == 'restaurant' && $layout == 'edit' && !$this->checkEditId('com_restaurant.edit.restaurant', $id))
        {
            // show error message
            $this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $id));
            $this->setMessage($this->getError(), 'error');
            // redirect back to the default view
            $this->setRedirect(JRoute::_('index.php?option=com_restaurant&view=restaurants', false));

            return false;
        }
        
        /*
         * call inherited JControllerLegacy::display() method
         * does the hard work that allows the componponent to display the view
         */
        parent::display();

        return $this;
    }
}