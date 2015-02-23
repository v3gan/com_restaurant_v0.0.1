<?php
defined('_JEXEC') or die ;

class RestaurantModelRestaurant extends JModelAdmin 
{
    /*
     * prefix used in controller messages (component name in this case)
     */
    protected $text_prefix = 'COM_RESTAURANT';
    
    protected function canDelete($record) {
        if (!empty($record -> id)) {
            if ($record -> state != -2) {
                return;
            }
            $user = JFactory::getUser();

            if ($record -> catid) {
                return $user -> authorise('core.delete', 'com_restaurant.category.' . (int)$record -> catid);
            } else {
                return parent::canDelete($record);
            }
        }
    }

    protected function canEditState($record) {
        $user = JFactory::getUser();

        if (!empty($record -> catid)) {
            return $user -> authorise('core.edit.state', 'com_restaurant.category.' . (int)$record -> catid);
        } else {
            return parent::canEditState($record);
        }
    }
    
    /**
     * Returns a reference to the a Table object, always creating it.
     * used to read and write to the database
     *
     * @param	type	The table type to instantiate (matches view name)
     * @param	string	A prefix for the table class name. Optional (<component name>Table).
     * @param	array	Configuration array for model. Optional.
     * @return	JTable	A database object
     * @since	2.5
     */
    public function getTable($type = 'Restaurant', $prefix = 'RestaurantTable', $config = array()) 
    {
        return JTable::getInstance($type, $prefix, $config);
    }

    /**
     * gets the form based on an xml file (/forms/restaruant.xml in this case)
     *
     * @param   array    $data      Data for the form.
     * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
     *
     * @return  mixed  A JForm object on success, false on failure
     *
     * @since   12.2
     */
    public function getForm($data = array(), $loadData = true) 
    {
        $app = JFactory::getApplication();
        
        /**
         * this comment is for loadForm called below
         * Method to get a form object
         *
         * @param   string   $name     The name of the form.
         * @param   string   $source   The form source. Can be XML string if file flag is set to false.
         * @param   array    $options  Optional array of options for the form creation.
         * @param   boolean  $clear    Optional argument to force load a new form.
         * @param   string   $xpath    An optional xpath to search for the fields.
         *
         * @return  mixed  JForm object on success, False on error.
         *
         * @see     JForm
         * @since   12.2
         */
        $form = $this -> loadForm('com_restaurant.restaurant', 'restaurant', array('control' => 'jform', 'load_data' => $loadData));
        if (empty($form)) 
        {
            return false;
        }

        return $form;
    }
    
    /**
     * Method to get the data that should be injected in the form.
     * ?? From book:
     *   loadForm function is called by getForm and loads the data into the form
     *
     * @return  array    The default data is an empty array.
     *
     * @since   12.2
     */
    protected function loadFormData() {
        $data = JFactory::getApplication() -> getUserState('com_restaurant.edit.restaurant.data', array());

        if (empty($data)) {
            $data = $this -> getItem();
        }

        return $data;
    }
    
    /**
     * Prepare and sanitise the table data prior to saving.
     *
     * @param   JTable  $table  A reference to a JTable object.
     *
     * @return  void
     *
     * @since   12.2
     */
    protected function prepareTable($table) {
        /*
         * htmlspecialchars_decode() decodes html entities ('&amp;' into '&' for example) 
         */
        $table -> restaurant = htmlspecialchars_decode($table -> restaurant, ENT_QUOTES);
    }
}
