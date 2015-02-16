


<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>TimeSeries.jl/README.md at master · JuliaStats/TimeSeries.jl · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="JuliaStats/TimeSeries.jl" name="twitter:title" /><meta content="TimeSeries.jl - Time series toolkit for Julia" name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/2761531?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/2761531?v=3&amp;s=400" property="og:image" /><meta content="JuliaStats/TimeSeries.jl" property="og:title" /><meta content="https://github.com/JuliaStats/TimeSeries.jl" property="og:url" /><meta content="TimeSeries.jl - Time series toolkit for Julia" property="og:description" />
      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="027EA0D9:72C7:237CA162:54E1E7B7" name="octolytics-dimension-request_id" />
    
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="0GhUVSKP2t7XvNUmQR2XV7/gBQ+8KBmFDVjTMq7yb0Bqg6kmisZMt+clkL1ORb939sx0V7INGtT3LG/njoYbfA==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-7f7a8d43d99dce26334cc1cb3b327f57a9309f9d6f215d6f3dff77d5e0c593a3.css" media="all" rel="stylesheet" />
    <link href="https://assets-cdn.github.com/assets/github2-001b8ff6b9af1d78d785feee91eaacf441aa9c531b0b1ad513b01221d194cb1d.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="eb9c2d1541587bf66c37d78ac6526205">

      
  <meta name="description" content="TimeSeries.jl - Time series toolkit for Julia">
  <meta name="go-import" content="github.com/JuliaStats/TimeSeries.jl git https://github.com/JuliaStats/TimeSeries.jl.git">

  <meta content="2761531" name="octolytics-dimension-user_id" /><meta content="JuliaStats" name="octolytics-dimension-user_login" /><meta content="7288296" name="octolytics-dimension-repository_id" /><meta content="JuliaStats/TimeSeries.jl" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="7288296" name="octolytics-dimension-repository_network_root_id" /><meta content="JuliaStats/TimeSeries.jl" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/JuliaStats/TimeSeries.jl/commits/master.atom" rel="alternate" title="Recent Commits to TimeSeries.jl:master" type="application/atom+xml">

  </head>


  <body class="logged_out  env-production linux vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      
      <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="button primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="button" href="/login?return_to=%2FJuliaStats%2FTimeSeries.jl%2Fblob%2Fmaster%2FREADME.md" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <form accept-charset="UTF-8" action="/JuliaStats/TimeSeries.jl/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/JuliaStats/TimeSeries.jl/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="(Logged out) Header, go to blog, text:blog">Blog</a>
          </li>
      </ul>

  </div>
</div>



      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2FJuliaStats%2FTimeSeries.jl"
    class="minibutton with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/JuliaStats/TimeSeries.jl/watchers">
    11
  </a>


  </li>

  <li>
      <a href="/login?return_to=%2FJuliaStats%2FTimeSeries.jl"
    class="minibutton with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/JuliaStats/TimeSeries.jl/stargazers">
      26
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2FJuliaStats%2FTimeSeries.jl"
        class="minibutton with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>
      <a href="/JuliaStats/TimeSeries.jl/network" class="social-count">
        8
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/JuliaStats" class="url fn" itemprop="url" rel="author"><span itemprop="title">JuliaStats</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/JuliaStats/TimeSeries.jl" class="js-current-repository" data-pjax="#js-repo-pjax-container">TimeSeries.jl</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/JuliaStats/TimeSeries.jl/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/JuliaStats/TimeSeries.jl" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /JuliaStats/TimeSeries.jl">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/JuliaStats/TimeSeries.jl/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /JuliaStats/TimeSeries.jl/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
      <a href="/JuliaStats/TimeSeries.jl/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /JuliaStats/TimeSeries.jl/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>


  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/JuliaStats/TimeSeries.jl/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /JuliaStats/TimeSeries.jl/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/JuliaStats/TimeSeries.jl/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /JuliaStats/TimeSeries.jl/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>
  </ul>


</nav>

              <div class="only-with-full-nav">
                  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/JuliaStats/TimeSeries.jl.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/JuliaStats/TimeSeries.jl" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<p class="clone-options">You can clone with
  <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a> or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>



                <a href="/JuliaStats/TimeSeries.jl/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of JuliaStats/TimeSeries.jl as a zip file"
                   title="Download the contents of JuliaStats/TimeSeries.jl as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/JuliaStats/TimeSeries.jl/blob/f5ed853d332fa646d3b8bc3f3e4199b364091e22/README.md" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:82eba2e38cda5e34b95c761bef199a63 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/blob/master/README.md"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/blob/metadata/README.md"
                 data-name="metadata"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="metadata">metadata</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/blob/param_meta/README.md"
                 data-name="param_meta"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="param_meta">param_meta</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/blob/simple_meta/README.md"
                 data-name="simple_meta"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="simple_meta">simple_meta</a>
            </div>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.7/README.md"
                 data-name="v0.4.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.7">v0.4.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.6/README.md"
                 data-name="v0.4.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.6">v0.4.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.5/README.md"
                 data-name="v0.4.5"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.5">v0.4.5</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.4/README.md"
                 data-name="v0.4.4"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.4">v0.4.4</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.3/README.md"
                 data-name="v0.4.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.3">v0.4.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.2/README.md"
                 data-name="v0.4.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.2">v0.4.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.1/README.md"
                 data-name="v0.4.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.1">v0.4.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.4.0/README.md"
                 data-name="v0.4.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.0">v0.4.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.14/README.md"
                 data-name="v0.3.14"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.14">v0.3.14</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.13/README.md"
                 data-name="v0.3.13"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.13">v0.3.13</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.12/README.md"
                 data-name="v0.3.12"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.12">v0.3.12</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.11/README.md"
                 data-name="v0.3.11"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.11">v0.3.11</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.10/README.md"
                 data-name="v0.3.10"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.10">v0.3.10</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.9/README.md"
                 data-name="v0.3.9"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.9">v0.3.9</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.8/README.md"
                 data-name="v0.3.8"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.8">v0.3.8</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.7/README.md"
                 data-name="v0.3.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.7">v0.3.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.6/README.md"
                 data-name="v0.3.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.6">v0.3.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.5/README.md"
                 data-name="v0.3.5"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.5">v0.3.5</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.4/README.md"
                 data-name="v0.3.4"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.4">v0.3.4</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.3/README.md"
                 data-name="v0.3.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.3">v0.3.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.2/README.md"
                 data-name="v0.3.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.2">v0.3.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.3.1/README.md"
                 data-name="v0.3.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.1">v0.3.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.7/README.md"
                 data-name="v0.1.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.7">v0.1.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.6/README.md"
                 data-name="v0.1.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.6">v0.1.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.5/README.md"
                 data-name="v0.1.5"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.5">v0.1.5</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.4/README.md"
                 data-name="v0.1.4"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.4">v0.1.4</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.3/README.md"
                 data-name="v0.1.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.3">v0.1.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.2/README.md"
                 data-name="v0.1.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.2">v0.1.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.1/README.md"
                 data-name="v0.1.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.1">v0.1.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/TimeSeries.jl/tree/v0.1.0/README.md"
                 data-name="v0.1.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.1.0">v0.1.0</a>
            </div>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="button-group right">
    <a href="/JuliaStats/TimeSeries.jl/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/JuliaStats/TimeSeries.jl" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">TimeSeries.jl</span></a></span></span><span class="separator">/</span><strong class="final-path">README.md</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="milktrader" class="avatar" data-user="324836" height="24" src="https://avatars0.githubusercontent.com/u/324836?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/milktrader" rel="contributor">milktrader</a></span>
        <time datetime="2014-11-04T20:56:26Z" is="relative-time">Nov 4, 2014</time>
        <div class="commit-title">
            <a href="/JuliaStats/TimeSeries.jl/commit/e6ce0a90033daef4bdeda212149f384c17504b67" class="message" data-pjax="true" title="added whitespace line to README to run travis">added whitespace line to README to run travis</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>3</strong>
           contributors
        </a>
      </p>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="milktrader" href="/JuliaStats/TimeSeries.jl/commits/master/README.md?author=milktrader"><img alt="milktrader" class="avatar" data-user="324836" height="20" src="https://avatars2.githubusercontent.com/u/324836?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="quinnj" href="/JuliaStats/TimeSeries.jl/commits/master/README.md?author=quinnj"><img alt="Jacob Quinn" class="avatar" data-user="2896623" height="20" src="https://avatars0.githubusercontent.com/u/2896623?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="IainNZ" href="/JuliaStats/TimeSeries.jl/commits/master/README.md?author=IainNZ"><img alt="Iain Dunning" class="avatar" data-user="692635" height="20" src="https://avatars0.githubusercontent.com/u/692635?v=3&amp;s=40" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="milktrader" data-user="324836" height="24" src="https://avatars0.githubusercontent.com/u/324836?v=3&amp;s=48" width="24" />
            <a href="/milktrader">milktrader</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Jacob Quinn" data-user="2896623" height="24" src="https://avatars2.githubusercontent.com/u/2896623?v=3&amp;s=48" width="24" />
            <a href="/quinnj">quinnj</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Iain Dunning" data-user="692635" height="24" src="https://avatars2.githubusercontent.com/u/692635?v=3&amp;s=48" width="24" />
            <a href="/IainNZ">IainNZ</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>175 lines (137 sloc)</span>
          <span class="meta-divider"></span>
        <span>4.147 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/JuliaStats/TimeSeries.jl/raw/master/README.md" class="minibutton " id="raw-url">Raw</a>
            <a href="/JuliaStats/TimeSeries.jl/blame/master/README.md" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/JuliaStats/TimeSeries.jl/commits/master/README.md" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->


            <a class="octicon-button disabled tooltipped tooltipped-w" href="#"
               aria-label="You must be signed in to make or propose changes"><span class="octicon octicon-pencil"></span></a>

          <a class="octicon-button danger disabled tooltipped tooltipped-w" href="#"
             aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
    
  <div id="readme" class="blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="mainContentOfPage"><h1>
<a id="user-content-timeseriesjl" class="anchor" href="#timeseriesjl" aria-hidden="true"><span class="octicon octicon-link"></span></a>TimeSeries.jl</h1>

<p><a href="https://travis-ci.org/JuliaStats/TimeSeries.jl"><img src="https://camo.githubusercontent.com/02b524b387e11b09c3eab73b9cbc2b281b97d2aa/68747470733a2f2f7472617669732d63692e6f72672f4a756c696153746174732f54696d655365726965732e6a6c2e706e67" alt="Build Status" data-canonical-src="https://travis-ci.org/JuliaStats/TimeSeries.jl.png" style="max-width:100%;"></a>
<a href="https://coveralls.io/r/JuliaStats/TimeSeries.jl?branch=master"><img src="https://camo.githubusercontent.com/2c9c37b9255db3f0a44ae634bb11ff7533e1f966/68747470733a2f2f636f766572616c6c732e696f2f7265706f732f4a756c696153746174732f54696d655365726965732e6a6c2f62616467652e706e673f6272616e63683d6d6173746572" alt="Coverage Status" data-canonical-src="https://coveralls.io/repos/JuliaStats/TimeSeries.jl/badge.png?branch=master" style="max-width:100%;"></a>
<a href="http://pkg.julialang.org/?pkg=TimeSeries&amp;ver=release"><img src="https://camo.githubusercontent.com/6b2037fde5e5952f5f006d97f2d124c5fe882ba6/687474703a2f2f706b672e6a756c69616c616e672e6f72672f6261646765732f54696d655365726965735f72656c656173652e737667" alt="TimeSeries" data-canonical-src="http://pkg.julialang.org/badges/TimeSeries_release.svg" style="max-width:100%;"></a></p>

<h4>
<a id="user-content-installation" class="anchor" href="#installation" aria-hidden="true"><span class="octicon octicon-link"></span></a>Installation</h4>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> Pkg<span class="pl-k">.</span><span class="pl-s3">add</span>(<span class="pl-s1"><span class="pl-pds">"</span>TimeSeries<span class="pl-pds">"</span></span>)</pre></div>

<p>Additionally, the MarketData package includes some <code>const</code> objects that include TimeArray objects. These
objects are historical price time series and can be used for testing, benchmarking or simply taking TimeSeries
functionality through some paces. </p>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> Pkg<span class="pl-k">.</span><span class="pl-s3">add</span>(<span class="pl-s1"><span class="pl-pds">"</span>MarketData<span class="pl-pds">"</span></span>)</pre></div>

<p>Alternately, you can create some dummy data with this code block.</p>

<div class="highlight highlight-julia"><pre>d <span class="pl-k">=</span> [<span class="pl-s3">Date</span>(<span class="pl-c1">1980</span>,<span class="pl-c1">1</span>,<span class="pl-c1">1</span>)<span class="pl-c1">:Date</span>(<span class="pl-c1">2015</span>,<span class="pl-c1">1</span>,<span class="pl-c1">1</span>)];
t <span class="pl-k">=</span> <span class="pl-s3">TimeArray</span>(d,<span class="pl-s3">rand</span>(<span class="pl-s3">length</span>(d)),[<span class="pl-s1"><span class="pl-pds">"</span>test<span class="pl-pds">"</span></span>])</pre></div>

<h4>
<a id="user-content-package-objective" class="anchor" href="#package-objective" aria-hidden="true"><span class="octicon octicon-link"></span></a>Package objective</h4>

<p>TimeSeries aims to provide a lightweight framework for working with time series data in Julia. There are less than 500 total lines of code 
in the <code>src/</code> directory.</p>

<h4>
<a id="user-content-quick-tour-of-current-api" class="anchor" href="#quick-tour-of-current-api" aria-hidden="true"><span class="octicon octicon-link"></span></a>Quick tour of current API</h4>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> <span class="pl-s">using</span> TimeSeries, MarketData

julia<span class="pl-k">&gt;</span> ohlc
<span class="pl-c1">500</span>x4 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Open    High    Low     Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">112.5</span>   <span class="pl-c1">101.69</span>  <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">108.25</span>  <span class="pl-c1">110.62</span>  <span class="pl-c1">101.19</span>  <span class="pl-c1">102.5</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-c1">103.75</span>  <span class="pl-c1">110.56</span>  <span class="pl-c1">103.0</span>   <span class="pl-c1">104.0</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">06</span> <span class="pl-k">|</span> <span class="pl-c1">106.12</span>  <span class="pl-c1">107.0</span>   <span class="pl-c1">95.0</span>    <span class="pl-c1">95.0</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">26</span> <span class="pl-k">|</span> <span class="pl-c1">21.35</span>   <span class="pl-c1">22.3</span>    <span class="pl-c1">21.14</span>   <span class="pl-c1">21.49</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">27</span> <span class="pl-k">|</span> <span class="pl-c1">21.58</span>   <span class="pl-c1">22.25</span>   <span class="pl-c1">21.58</span>   <span class="pl-c1">22.07</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">21.97</span>   <span class="pl-c1">23.0</span>    <span class="pl-c1">21.96</span>   <span class="pl-c1">22.43</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-c1">22.51</span>   <span class="pl-c1">22.66</span>   <span class="pl-c1">21.83</span>   <span class="pl-c1">21.9</span></pre></div>

<h6>
<a id="user-content-split" class="anchor" href="#split" aria-hidden="true"><span class="octicon octicon-link"></span></a>Split</h6>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> ohlc[<span class="pl-c1">1</span>]
<span class="pl-c1">1</span>x4 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span>

             Open    High    Low     Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">112.5</span>   <span class="pl-c1">101.69</span>  <span class="pl-c1">111.94</span>

julia<span class="pl-k">&gt;</span> ohlc[<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">2</span>]
<span class="pl-c1">2</span>x4 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span>

             Open    High    Low     Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">112.5</span>   <span class="pl-c1">101.69</span>  <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">108.25</span>  <span class="pl-c1">110.62</span>  <span class="pl-c1">101.19</span>  <span class="pl-c1">102.5</span>

julia<span class="pl-k">&gt;</span> ohlc[[<span class="pl-s3">Date</span>(<span class="pl-c1">2000</span>,<span class="pl-c1">1</span>,<span class="pl-c1">3</span>), <span class="pl-s3">Date</span>(<span class="pl-c1">2000</span>,<span class="pl-c1">1</span>,<span class="pl-c1">14</span>)]]
<span class="pl-c1">2</span>x4 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">14</span>

             Open    High    Low     Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">112.5</span>   <span class="pl-c1">101.69</span>  <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">14</span> <span class="pl-k">|</span> <span class="pl-c1">100.0</span>   <span class="pl-c1">102.25</span>  <span class="pl-c1">99.38</span>   <span class="pl-c1">100.44</span>

julia<span class="pl-k">&gt;</span> ohlc[<span class="pl-s1"><span class="pl-pds">"</span>Low<span class="pl-pds">"</span></span>][<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">2</span>]
<span class="pl-c1">2</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span>

             Low
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">101.69</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">101.19</span>

julia<span class="pl-k">&gt;</span> ohlc[<span class="pl-s1"><span class="pl-pds">"</span>Open<span class="pl-pds">"</span></span>, <span class="pl-s1"><span class="pl-pds">"</span>Close<span class="pl-pds">"</span></span>][<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">2</span>]
<span class="pl-c1">2</span>x2 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span>

             Open    Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">108.25</span>  <span class="pl-c1">102.5</span></pre></div>

<h6>
<a id="user-content-apply" class="anchor" href="#apply" aria-hidden="true"><span class="octicon octicon-link"></span></a>Apply</h6>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> op[<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">3</span>] .<span class="pl-k">-</span> cl[<span class="pl-c1">2</span><span class="pl-k">:</span><span class="pl-c1">4</span>]
<span class="pl-c1">2</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> to <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span>

             Op.<span class="pl-k">-</span>Cl
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">5.75</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-k">-</span><span class="pl-c1">0.25</span>

julia<span class="pl-k">&gt;</span> <span class="pl-c1">2.</span><span class="pl-k">*</span>cl
<span class="pl-c1">500</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">223.88</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">205.0</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-c1">208.0</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">06</span> <span class="pl-k">|</span> <span class="pl-c1">190.0</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">26</span> <span class="pl-k">|</span> <span class="pl-c1">42.98</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">27</span> <span class="pl-k">|</span> <span class="pl-c1">44.14</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">44.86</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-c1">43.8</span>

julia<span class="pl-k">&gt;</span> <span class="pl-s3">percentchange</span>(cl, method<span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">"</span>log<span class="pl-pds">"</span></span>)
<span class="pl-c1">499</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-k">-</span><span class="pl-c1">0.09</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-c1">0.01</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">06</span> <span class="pl-k">|</span> <span class="pl-k">-</span><span class="pl-c1">0.09</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">07</span> <span class="pl-k">|</span> <span class="pl-c1">0.05</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">26</span> <span class="pl-k">|</span> <span class="pl-c1">0.01</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">27</span> <span class="pl-k">|</span> <span class="pl-c1">0.03</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">0.02</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-k">-</span><span class="pl-c1">0.02</span>

julia<span class="pl-k">&gt;</span> <span class="pl-s3">basecall</span>(cl, cumsum)
<span class="pl-c1">500</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">214.44</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-c1">318.44</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">06</span> <span class="pl-k">|</span> <span class="pl-c1">413.44</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">26</span> <span class="pl-k">|</span> <span class="pl-c1">23028.84</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">27</span> <span class="pl-k">|</span> <span class="pl-c1">23050.91</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">23073.34</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-c1">23095.24</span>i</pre></div>

<h6>
<a id="user-content-combine" class="anchor" href="#combine" aria-hidden="true"><span class="octicon octicon-link"></span></a>Combine</h6>

<div class="highlight highlight-julia"><pre>julia<span class="pl-k">&gt;</span> <span class="pl-s3">merge</span>(op,cl)
<span class="pl-c1">500</span>x2 TimeArray{Float64,<span class="pl-c1">2</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Open    Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">03</span> <span class="pl-k">|</span> <span class="pl-c1">104.88</span>  <span class="pl-c1">111.94</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">04</span> <span class="pl-k">|</span> <span class="pl-c1">108.25</span>  <span class="pl-c1">102.5</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">05</span> <span class="pl-k">|</span> <span class="pl-c1">103.75</span>  <span class="pl-c1">104.0</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">06</span> <span class="pl-k">|</span> <span class="pl-c1">106.12</span>  <span class="pl-c1">95.0</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">26</span> <span class="pl-k">|</span> <span class="pl-c1">21.35</span>   <span class="pl-c1">21.49</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">27</span> <span class="pl-k">|</span> <span class="pl-c1">21.58</span>   <span class="pl-c1">22.07</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">21.97</span>   <span class="pl-c1">22.43</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-c1">22.51</span>   <span class="pl-c1">21.9</span>

julia<span class="pl-k">&gt;</span> <span class="pl-s3">collapse</span>(cl, last)
<span class="pl-c1">105</span>x1 TimeArray{Float64,<span class="pl-c1">1</span>} <span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">07</span> to <span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span>

             Close
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">07</span> <span class="pl-k">|</span> <span class="pl-c1">99.5</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">14</span> <span class="pl-k">|</span> <span class="pl-c1">100.44</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">21</span> <span class="pl-k">|</span> <span class="pl-c1">111.31</span>
<span class="pl-c1">2000</span><span class="pl-k">-</span><span class="pl-c1">01</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">101.62</span>
⋮
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">14</span> <span class="pl-k">|</span> <span class="pl-c1">20.39</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">21</span> <span class="pl-k">|</span> <span class="pl-c1">21.0</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">28</span> <span class="pl-k">|</span> <span class="pl-c1">22.43</span>
<span class="pl-c1">2001</span><span class="pl-k">-</span><span class="pl-c1">12</span><span class="pl-k">-</span><span class="pl-c1">31</span> <span class="pl-k">|</span> <span class="pl-c1">21.9</span></pre></div>
</article>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="http://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="http://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.03239s from github-fe140-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
    </ul>
  </div>
</div>


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-996268c2962f947579cb9ec2908bd576591bc94b6a2db184a78e78815022ba2c.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-2dc264df91dd435f94e97f2029e5c4ffb0f1824bd52c2651574045439d01f98b.js"></script>
      
      

  </body>
</html>

