
    </div><!-- /.main-content -->
</div>
{if $templatefile ne "login" and $templatefile ne "pwreset"}
<footer class="space--sm footer-2 bg--secondary">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3 col-xs-6">
                <h6 class="type--uppercase">Company</h6>

                <ul class="list--hover">
                    <li><a href="#">About Company</a></li>

                    <li><a href="#">Our Team</a></li>

                    <li><a href="#">Locations</a></li>

                    <li><a href="#">History</a></li>

                    <li><a href="#">Work With Us</a></li>
                </ul>
            </div>

            <div class="col-sm-6 col-md-3 col-xs-6">
                <h6 class="type--uppercase">Developers</h6>

                <ul class="list--hover">
                    <li><a href="#">Developer Center</a></li>

                    <li><a href="#">API Reference</a></li>

                    <li><a href="#">Downloads</a></li>

                    <li><a href="#">Tools</a></li>

                    <li><a href="#">Developer Blog</a></li>

                    <li><a href="#">Developer Forums</a></li>
                </ul>
            </div>

            <div class="col-sm-6 col-md-3 col-xs-6">
                <h6 class="type--uppercase">Support</h6>

                <ul class="list--hover">
                    <li><a href="#">Help Center</a></li>

                    <li><a href="#">Live Chat</a></li>

                    <li><a href="#">Downloads</a></li>

                    <li><a href="#">Press Kit</a></li>
                </ul>
            </div>

            <div class="col-sm-6 col-md-3 col-xs-6">
                <h6 class="type--uppercase">Locations</h6>

                <ul class="list--hover">
                    <li><a href="#">Melbourne</a></li>

                    <li><a href="#">London</a></li>

                    <li><a href="#">New York</a></li>

                    <li><a href="#">San Francisco</a></li>
                </ul>
            </div>
        </div><!--end of row-->

        <div class="row">
            <div class="col-sm-6">
                <span class="type--fine-print">&copy; <span class="update-year">{$date_year}</span> {$companyname}.</span> <a class="type--fine-print" href="#">Privacy Policy</a> <a class="type--fine-print" href="#">Legal</a>
            </div>

            <div class="col-sm-6 text-right text-left-xs">
                <ul class="social-list list-inline list--hover">
                    <li><a href="#"></a></li>

                    <li><a href="#"></a></li>

                    <li><a href="#"></a></li>

                    <li><a href="#"></a></li>
                </ul>
            </div>
        </div><!--end of row-->
    </div><!--end of container-->
</footer>
{/if}
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/lightslider.js?v={$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/select2.min.js?v={$versionHash}"></script>
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/clipboard.min.js?v={$versionHash}"></script>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Title</h4>
            </div>
            <div class="modal-body panel-body">
                Loading...
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>

{$footeroutput}

</body>
</html>
