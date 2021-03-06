<div class="container">
	<div class="row">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i> <?php echo $this->lang->line('dashboard'); ?>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="row">
		<div class="span12">
			<h3><?php echo $this->lang->line('choose_contest'); ?></h3>	
			<p><?php echo $this->lang->line('please_choose_contest'); ?></p>

			<?php if (empty($contests)) : ?>
				<div class="alert alert-error">
					<?php echo $this->lang->line('no_contest'); ?>
	    		</div>
    		<?php else : ?>
				<form class="form-inline" action="" method="post">
					<select name="form[contest_id]" class="span10">
						<?php foreach ($contests as $v) : ?>
							<option value="<?php echo $v['id']; ?>"><?php echo $v['name']; ?></option>
						<?php endforeach; ?>
					</select>
					<button type="submit" class="btn btn-danger"><i class="icon-fire icon-white"></i> <?php echo $this->lang->line('compete'); ?></button>
				</form>
			<?php endif; ?>
		</div>
	</div>
	
</div>