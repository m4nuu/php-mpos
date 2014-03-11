{if $smarty.session.AUTHENTICATED|default}
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <h4 class="panel-title"><i class="fa fa-align-left fa-fw"></i> Overview</span></h4>
      </div>
      <div class="panel-body text-center">
        <div class="row">
          <div class="col-lg-12">
          {* Load our payout system so we can load some payout specific templates *}
          {assign var=PAYOUT_SYSTEM value=$GLOBAL.config.payout_system}
          {include file="dashboard/overview/default.tpl"}
          {include file="dashboard/round_statistics/$PAYOUT_SYSTEM/default.tpl"}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {include file="dashboard/account_data/default.tpl"}
            {include file="dashboard/worker_information/default.tpl"}
          </div>
        </div>
      </div>
      <div class="panel-footer overview">
        <h6>Refresh interval: {$GLOBAL.config.statistics_ajax_refresh_interval|default:"10"} seconds. Hashrate based on shares submitted in the past {$INTERVAL|default:"5"} minutes.</h6>
      </div>
    </div>
  </div>
</div>
  {* Include our JS libraries, we allow a live updating JS and a static one *}
  {if !$DISABLED_DASHBOARD and !$DISABLED_DASHBOARD_API}
  {include file="dashboard/js/api.tpl"}
  {else}
  {include file="dashboard/js/static.tpl"}
  {/if}
{/if}
