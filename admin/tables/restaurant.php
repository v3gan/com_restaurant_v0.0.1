<?php
defined('_JEXEC') or die;

/**
 * Restaurant List Table class
 * \libraries\joomla\table\table.php
 * 
*/

class RestaurantTableRestaurant extends JTable
{	
    /**
     * Object constructor to set table and key fields.  In most cases this will
     * be overridden by child classes to explicitly set the table and key fields
     * for a particular database table.
     *
     * @param   string           $table  Name of the table to model.
     * @param   mixed            $key    Name of the primary key field in the table or array of field names that compose the primary key.
     * @param   JDatabaseDriver  $db     JDatabaseDriver object.
     *
     * @since   11.1
     */
	public function __construct(&$db)
	{
		parent::__construct('#__rl_disp_restaurant_list', 'id', $db);
	}

    /**
     * Method to bind an associative array or object to the JTable instance.
     * Used to prepare data immediately before it is saved to the database.
     * This method only binds properties that are publicly accessible and optionally
     * takes an array of properties to ignore when binding.
     * 
     * @param   mixed  $src     An associative array or object to bind to the JTable instance.
     * @param   mixed  $ignore  An optional array or space separated list of properties to ignore while binding.
     *
     * @return  boolean  True on success.
     *
     * @since   11.1
     * @throws  InvalidArgumentException
     */

	public function bind($array, $ignore = '')
	{
		return parent::bind($array, $ignore);
	}
    
    /**
     * Method to store a row in the database from the JTable instance properties.
     * This writes the data to the database when the form is submitted.
     * If a primary key value is set the row with that primary key value will be
     * updated with the instance property values.  
     * If no primary key value is set a new row will be inserted 
     * into the database with the properties from the JTable instance.
     *
     * @param   boolean  $updateNulls  True to update fields even if they are null.
     *
     * @return  boolean  True on success.
     *
     * @link    http://docs.joomla.org/JTable/store
     * @since   11.1
    */
	public function store($updateNulls = false)
	{
		return parent::store($updateNulls);
	}
    
    /*
     * override is necessary because the table column is named "pub_state" instead of
     * "published"
     * this toggles the value in the table when the "published" button is pressed
     */
    public function publish($pks = null, $state = 1, $userId = 0)
    {
        $k = $this->_tbl_key;

        JArrayHelper::toInteger($pks);
        $state = (int) $state;

        if (empty($pks))
        {
            if ($this->$k)
            {
                $pks = array($this->$k);
            }
            else
            {
                $this->setError(JText::_('JLIB_DATABASE_ERROR_NO_ROWS_SELECTED'));
                return false;
            }
        }

        $where = $k . '=' . implode(' OR ' . $k . '=', $pks);

        $query = $this->_db->getQuery(true)
            ->update($this->_db->quoteName($this->_tbl))
            ->set($this->_db->quoteName('pub_state') . ' = ' . (int) $state)
            ->where($where);
        $this->_db->setQuery($query);

        try
        {
            $this->_db->execute();
        }
        catch (RuntimeException $e)
        {
            $this->setError($e->getMessage());
            return false;
        }

        if (in_array($this->$k, $pks))
        {
            $this->state = $state;
        }

        $this->setError('');

        return true;
    }
}