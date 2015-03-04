<?php
defined('_JEXEC') or die;
/*
 * baseclass of JControllerForm at:
 *  /libraries/legacy/controller/form.php
 * check it out to see the fuctionality this class provides  
 */
class RestaurantControllerRestaurant extends JControllerForm
{
    /*
     * almost all of the code below is related to category permissions and
     * may not be all that useful if we are not using categories
     */
    protected function allowAdd($data=array())
    {
        $user = JFactory::getUser();
        $categoryId = JArrayHelper::getValue($data, 'catid',$this->input->getInt('filter_category_id'),'int');
        $allow = null;
        
        if($categoryId){
            // if the category has been passed in the URL check it
            $allow = $user->authorise('core.create',$this->option . ' . category . ' . $categoryId)
        }
        
        if($allow === null){
            // in the absense of better info, 
            // revert to the component permissions
            return parent::allowAdd($data);
        }
        else {
            return $allow;
        }
    }
    
    protected function allowEdit($data=array(),$key = 'id')
    {
        $recordId = (int) isset($data[$key]) ? $data[$key] : 0;
        $categoryId = 0;
        if($recordId)
        {
            $categoryId = (int) $this->getModel()->getItem($recordId)->catid;
        }
        if($categoryId){
            // the cat id has been set. Check the cat permissions
            return JFactory::getUser()->authorise('core.edit',$this->option . ' . category . ' $categoryId)
        }else {
            // since there is no asset tracking, revert to component permissions
            return parent::allowEdit($data,$key);
        }
    }
}