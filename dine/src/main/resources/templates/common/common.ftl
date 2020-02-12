<#macro contentWrapper>
<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">
<body class="ms-body ms-aside-left-open ms-primary-theme ms-has-quickbar">
<!-- Preloader -->
<div id="preloader-wrap">
    <div class="spinner spinner-8">
        <div class="ms-circle1 ms-child"></div>
        <div class="ms-circle2 ms-child"></div>
        <div class="ms-circle3 ms-child"></div>
        <div class="ms-circle4 ms-child"></div>
        <div class="ms-circle5 ms-child"></div>
        <div class="ms-circle6 ms-child"></div>
        <div class="ms-circle7 ms-child"></div>
        <div class="ms-circle8 ms-child"></div>
        <div class="ms-circle9 ms-child"></div>
        <div class="ms-circle10 ms-child"></div>
        <div class="ms-circle11 ms-child"></div>
        <div class="ms-circle12 ms-child"></div>
    </div>
</div>
<!-- Overlays -->
<div class="ms-aside-overlay ms-overlay-left ms-toggler" data-target="#ms-side-nav" data-toggle="slideLeft"></div>
<div class="ms-aside-overlay ms-overlay-right ms-toggler" data-target="#ms-recent-activity"
     data-toggle="slideRight"></div>

<#include "sidebar-nav-right.ftl">
<#include "sidebar-right.ftl">
<!-- Main Content -->
<main class="body-content">
    <!-- Navigation Bar -->
    <#include "body-header.ftl">
    <!-- ms-content- wrapper -->
    <#nested/>
</main>

<#include "quick-bar.ftl">
<#include "script.ftl">

</body>

</html>
</#macro>