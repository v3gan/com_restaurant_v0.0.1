<?php
defined('_JEXEC') or die ;

function format_phone($phone) {
    preg_match('/^(\d{3})(\d{3})(\d{4})$/', $phone, $matches);
    $result = $matches[1] . '.' . $matches[2] . '.' . $matches[3];
    return $result;
}
?>

<?php if (!empty( $this->sidebar)) : ?>
	<div id="j-sidebar-container" class="span2">
		<?php echo $this -> sidebar; ?>
	</div>
	<div id="j-main-container" class="span10">
<?php else : ?>
	<div id="j-main-container">
<?php endif; ?>
		<div class="clearfix"> </div>

		<div class="mypreview">
            <div class="restaurants<?php echo $moduleclass_sfx ?>">
                <div style="margin-bottom:.5em;">
                    <button id="btnHideShow" type="button" class="btn btn-success">&nbsp;</button>
                </div>
                <?php $currentNeighborhoodId = -1; ?>
                <div id="neighborhoods-acc" class="accordion">
                    <?php foreach($this->items as $i => $item) : ?>
                        <?php if($item->neighborhood_id != $currentNeighborhoodId): ?> 
                            <!--start a new neighborhood-->
                            <?php if($currentNeighborhoodId != -1): ?> 
                                <!--not the first neighborhood so close the previous accordion-group, accordion-body, and accordion-inner-->
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                            
                            <!--set the current neighborhood to this item-->
                            <?php $currentNeighborhoodId = $item -> neighborhood_id; ?>
                            
                            <!--start the new accordion group for this neighborhood-->
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle neighborhood-<?php echo $item->hex_text ?>" 
                                        style="background-color: #<?php echo $item->hex_background ?>;" 
                                        href="#collapse<?php echo $item->hex_background ?>" data-toggle="collapse" 
                                        data-parent="#neighborhoods-acc"> <?php echo $item->neighborhood ?> </a>
                                </div>
                                <div id="collapse<?php echo $item->hex_background ?>" class="accordion-body collapse">
                                    <div class="accordion-inner">
                        <?php endif; ?>
                        
                        <div class="row-fluid bottom-dotted">
                            <!--
                                todo: blank/missing fields
                                todo: acute e (as in cafe)
                                done: hover effects
                                done: slide close/slide open
                                done: bottom-dotted
                            -->
                            <div class="span2 restaurant-name<?php if($item->display_logo == 1): ?> display-logo<?php endif; ?>">
                                <?php echo $item->restaurant ?></div>
                            <div class="span2">
                                <?php if(isset($item->website) && !(trim($item->website)==='')): ?>
                                    <a href="<?php echo $item -> website; ?>" target="_blank"><?php echo $item -> website; ?></a><br />
                                <?php endif; ?>
                                <?php if(isset($item->phone) && !(trim($item->phone)==='')): ?>
                                    <?php echo format_phone($item -> phone); ?><br />
                                <?php endif; ?>
                                <?php if(isset($item->address1) && !(trim($item->address1)==='')): ?>
                                    <?php echo $item -> address1; ?>,&nbsp;<?php echo $item -> zip; ?>
                                <?php endif; ?>
                            </div>
                            <div class="span7 offset1"><?php echo $item -> blurb; ?></div>
                        </div>                                         
                    <?php endforeach; ?>
                </div>
            </div>
		</div>

	</div>
</form>