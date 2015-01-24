<?php
defined('_JEXEC') or die;
/*
 * The list is displayed in a form.
 * The form is submitted when the view filters change or pagination is clicked.
 * The form's 'action' attribute is set to a url that is passed through JRoute.
 * JRoute helps with routing and allows Joomla to keep track of the currently active menu item.
 * The form is submitted to this view (which is the default view).
 * The 'name' and 'id' attributes must be 'adminForm' for the save and close buttons to work
 */

//  get the current user for pub_state setting auth below
$user = JFactory::getUser();
$listOrder	= $this->escape($this->state->get('list.ordering'));
$listDirn	= $this->escape($this->state->get('list.direction'));
$canOrder   = $user->authorise('core.edit.state','com_restaurant');
$saveOrder  = $listOrder == 'r.ordering';
if ($saveOrder)
{
    $saveOrderingUrl = 'index.php?option=com_restaurant&task=restaurants.saveOrderAjax&tmpl=component';
    // note that restauratnList = id of the table and adminForm = id of the enclosing form
    JHtml::_('sortablelist.sortable','restaurantList','adminForm',strtolower($listDirn),saveOrderingUrl);
}
$sortFields = $this->getSortFields();
?>
<!-- this is standard javaScript needed by the ordering column -->
<script type="text/javascript">
    Joomla!.orderTable = function(){
        table = document.getElementById("sortTable");
        direction = document.getElementById("directionTable");
        order = table.options[table.selectedIndex].value;
        if (order != '<?php echo $listOrder; ?>'){
            dirn = 'asc';
        }
        else {
            dirn = direction.options[direction.selectedIndex].value;
        } 
        Joomla!tableOrdering(order, dirn, '')
    }
</script>
<form action="<?php echo JRoute::_('index.php?option=com_restaurant&view=restaurants'); ?>" method="post" name="adminForm" id="adminForm">
    <?php if(!empty($this->sidebar)) : ?>
        <div id="j-sidebar-container", class="span2">
            <?php echo $this->sidebar; ?>
        </div>
	    <div id="j-main-container" class="span10">
	<?php else : ?>
	   <div id="j-main-container">
	<?php endif; ?>
	   <div class="clearfix"> </div>
		<table class="table table-striped" id="restaurantList">
			<thead>
				<tr>
				    <th width="1%" class="nowrap center hidden-phone">
				        <?php echo JHtml::_('grid.sort','<i class="icon-menu-2></i>"','r.ordering',$listDirn,$listOrder,null,'asc','JGRID_HEADING_ORDERING'); ?>
				    </th>
				    <!--check all checkbox-->
					<th width="1%" class="hidden-phone">
						<input type="checkbox" name="checkall-toggle" value="" title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)" />
					</th>
					<th width="1%" style="min-width: 55px" class="nowrap center">
				        <?php echo JHtml::_('grid.sort', 'JSTATUS', 'r.pub_state', $listDirn, $listOrder); ?>
					</th>
					<th class="title">
						<?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_RESTAURANT', 'r.restaurant', $listDirn, $listOrder); ?>
					</th>
                    <th width="10%" class="nowrap hidden-phone">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_NEIGHBORHOOD','n.name', $listDirn, $listOrder); ?>
                    </th>
                    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_PHONE','r.phone', $listDirn, $listOrder); ?>
                    </th>
                    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_ADDRESS1','r.address1', $listDirn, $listOrder); ?>
                    </th>                   
                    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_ZIP','r.zip', $listDirn, $listOrder); ?>
                    </th>                   
				    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_DISPLAY_LOGO','r.display_logo', $listDirn, $listOrder); ?>
                    </th>
                    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_WEBSITE','r.website', $listDirn, $listOrder); ?>
                    </th>
                    <th width="10%" class="nowrap">
                        <?php echo JHtml::_('grid.sort', 'COM_RESTAURANT_HEADING_BLURB','r.blurb', $listDirn, $listOrder); ?>
                    </th>
				</tr>
			</thead>
			<tbody>
			<?php foreach ($this->items as $i => $item) : 
                /*
                 * unauthorised users will see greyed out status buttons
                 * see jgrid.published call in second td below
                 */
			    $canCheckin = $user->authorise('core.manage','com_checkin')
                    || $item->$checked_out == $user->get('id') 
                    || $item->$checked_out == 0;
                $canChange = $user->authorise('core.edit.state', 'com_restaurant')
                    && $canCheckin;
                 ?>
				<tr class="row<?php echo $i % 2; ?>" sortable-group-id="1">
				    <!-- this is the ordering row, the code is standard -->
				    <td class="order nowrap center hidden-phone">
				        <?php if ($canChange) :
                            $disableClassName = '';
                            $disabledLabel = '';
                            if (!$saveOrder) :
                                $disabledLabel = JText::_('JORDERINGDISABLED');
                                $disableClassName = 'inactive tip-top';
                            endif; ?>
                            <span class="sortable-handler hasToolTip <?php echo $disableClassName ?>" 
                                title="<?php echo $disabledLabel ?>">
                                <i class="icon-menu"></i>
                            </span>
                            <input type="text" style="display:none" 
                                name="order[]" size="5" 
                                value="<?php echo $item->ordering; ?>" 
                                class="width-20 text-area-order " />
                        <?php else : ?>
                            <span class="sortable-handler inactive" >
                                <i class="icon-menu"></i>
                            </span>
                        <?php endif; ?>
				    </td>
					<td class="center hidden-phone">
						<?php echo JHtml::_('grid.id', $i, $item->id); ?>
					</td>
					<td class="center">
					    <?php echo JHtml::_('jgrid.published',$item->pub_state,$i,'restaurants.',$canChange,'cb',$item->publish_up,$item->publish_down); ?>					   
					</td>
					<td class="nowrap has-context">
						<a href="<?php echo JRoute::_('index.php?option=com_restaurant&task=restaurant.edit&id='.(int) $item->id); ?>">
							<?php echo $this->escape($item->restaurant); ?>
						</a>
					</td>
                    <td class="center hidden-phone">
                        <?php echo $this->escape($item->name); ?>
                    </td>
                    <td>
                        <?php echo $this->escape($item->phone); ?>
                    </td>
                    <td class="center">
                        <?php echo $this->escape($item->address1); ?>
                    </td>
                    <td class="center">
                        <?php echo $this->escape($item->zip); ?>
                    </td>	
                    <td class="center">
                        <?php echo $this->escape($item->display_logo); ?>
                    </td>
                    <td class="center">
                        <?php echo $this->escape($item->website); ?>
                    </td>
                    <td class="center">
                        <?php echo $this->escape($item->blurb); ?>
                    </td>				
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>

		<input type="hidden" name="task" value="" />
		<input type="hidden" name="boxchecked" value="0" />
		<input type="hidden" name="filter_order" value="<?php echo $listOrder; ?>" />
		<input type="hidden" name="filter_order_Dir" value="<?php echo $listDirn; ?>" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>