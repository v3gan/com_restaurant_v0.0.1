<?php
defined('_JEXEC') or die ;
/*
 * Form submitted by 'Save' button.
 * Jroute is used to aviod SEF issues.
 * 'form-validate' class allows required fields in the xml file
 * 
 * 
 */
?>

<form action="<?php echo JRoute::_('index.php?option=com_restaurant&layout=edit&id=' . (int)$this -> item -> id); ?>" method="post" name="adminForm" id="adminForm" class="form-validate">
    <div class="row-fluid">
        <div class="span10 form-horizontal">
            <fieldset>
                <!-- use bootstrap to show tabs -->
                <?php echo JHtml::_('bootstrap.startPane', 'myTab', array('active' => 'details')); ?>
                <?php echo JHtml::_('bootstrap.addPanel', 'myTab', 'details', empty($this -> item -> id) ? JText::_('COM_RESTAURANT_NEW_RESTAURANT', true) : JText::sprintf('COM_RESTAURANT_EDIT_RESTAURANT', $this -> item -> id, true)); ?>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this -> form -> getLabel('restaurant'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this -> form -> getInput('restaurant'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('catid'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('catid'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('pub_state'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('pub_state'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('neighborhood_id'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('neighborhood_id'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('address1'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('address1'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('address2'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('address2'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('city'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('city'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('state'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('state'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('zip'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('zip'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('display_logo'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('display_logo'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('website'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('website'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('phone'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('phone'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('fax'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('fax'); ?>
                    </div>
                </div>
                <div class="control-group">
                    <div class="control-label">
                        <?php echo $this->form->getLabel('blurb'); ?>
                    </div>
                    <div class="controls">
                        <?php echo $this->form->getInput('blurb'); ?>
                    </div>
                </div>
   
                <?php echo JHtml::_('bootstrap.endPanel'); ?>
                <!-- hidden field to determine task -->
                <input type="hidden" name="task" value="" />
                <?php echo JHtml::_('form.token'); ?>

                <?php echo JHtml::_('bootstrap.endPane'); ?>
            </fieldset>
        </div>
    </div>
</form>