<?php
defined('_JEXEC') or die;

class RestaurantModelPreview extends JModelList
{
    public function __construct($config = array())
    {
        /*
         * 'filter_fields' is an array/whitelist of all the fields 
         * being used by the view  
        */
        if (empty($config['filter_fields']))
        {
            $config['filter_fields'] = array(
                'id'
                ,'r.id'
                ,'restaurant'
                ,'r.restaurant'
                ,'pub_state'
                ,'r.pub_state'
                ,'neighborhood_id'
                ,'r.neighborhood_id'
                ,'hex_background'
                ,'r.hex_background'
                ,'hex_text'
                ,'r.hex_text'
                ,'name'
                ,'n.name'
                ,'address1'
                ,'r.address1'
                ,'address2'
                ,'r.address2'
                ,'city'
                ,'r.city'
                ,'state'
                ,'r.state'
                ,'zip'
                ,'r.zip'
                ,'phone'
                ,'r.phone'
                ,'fax'
                ,'r.fax'
                ,'display_logo'
                ,'r.display_logo'
                ,'website'
                ,'r.website'
                ,'blurb'
                ,'r.blurb'
                ,'publish_up'
                ,'r.publish_up'
                ,'publish_down'
                ,'r.publish_down'
                ,'ordering'
                ,'r.ordering'
            );
        }
        parent::__construct($config);
    }
    

    protected function populateState($ordering=null, $direction = null)
    {
        $this->setState('list.limit', 0);
    }
    
    /**
    * Method to get a JDatabaseQuery object for retrieving the data set from a database.
    *
    * @return  JDatabaseQuery   A JDatabaseQuery object to retrieve the data set.
    *
    * @since   12.2
    */
    protected function getListQuery()
    {
        $db     = $this->getDbo();
        $query  = $db->getQuery(true);
        /*
         * gettState() checks if the state variable in the 
         * first arguement ('list.select' in this case)
         * has been defined, otherwise it defaults to the 
         * select list string in the second arguement
         */
        $query->select(
            $this->getState(
                'list.select',
                'r.id, r.restaurant,r.hex_background,r.hex_text,'.
                'r.pub_state,n.name,r.address1,r.neighborhood_id,'.
                'r.address2,r.city,r.state,r.zip,r.phone,'.                
                'r.fax,r.display_logo,r.website,r.blurb,'.
                'r.publish_up,r.publish_down,r.ordering'
            )
        );
        /*
         * build the from clause
         */
        $query->from($db->quoteName('#__rl_disp_restaurant_list','r'));
        $query->join('LEFT',$db->quoteName('#__rl_neighborhood','n').
        ' ON ('.$db->quoteName('r.neighborhood_id').' = '.$db->quoteName('n.id').')');    
        
        $query->where('(r.pub_state IN (0,1))');
        
        $query->order($db->escape('r.neighborhood_sort_order asc, r.restaurant asc'));                                                                                                  

        return $query;
       }
    }