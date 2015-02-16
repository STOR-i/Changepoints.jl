<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>Distributions.jl/README.md at master · JuliaStats/Distributions.jl · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="JuliaStats/Distributions.jl" name="twitter:title" /><meta content="Distributions.jl - A Julia package for probability distributions and associated functions." name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/2761531?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/2761531?v=3&amp;s=400" property="og:image" /><meta content="JuliaStats/Distributions.jl" property="og:title" /><meta content="https://github.com/JuliaStats/Distributions.jl" property="og:url" /><meta content="Distributions.jl - A Julia package for probability distributions and associated functions." property="og:description" />
      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="027EA0D9:202C:32CF1F71:54E1E74A" name="octolytics-dimension-request_id" />
    
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="cG/js9z/X0qJ1qhUERlmpyTKtdDK3tjRbuOvCw1+ZvxxqqJ9Nv+b0BF/q9XG1jnU0eKDuQt95uRWaw81kuLJmA==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-7f7a8d43d99dce26334cc1cb3b327f57a9309f9d6f215d6f3dff77d5e0c593a3.css" media="all" rel="stylesheet" />
    <link href="https://assets-cdn.github.com/assets/github2-001b8ff6b9af1d78d785feee91eaacf441aa9c531b0b1ad513b01221d194cb1d.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="eb9c2d1541587bf66c37d78ac6526205">

      
  <meta name="description" content="Distributions.jl - A Julia package for probability distributions and associated functions.">
  <meta name="go-import" content="github.com/JuliaStats/Distributions.jl git https://github.com/JuliaStats/Distributions.jl.git">

  <meta content="2761531" name="octolytics-dimension-user_id" /><meta content="JuliaStats" name="octolytics-dimension-user_login" /><meta content="6619192" name="octolytics-dimension-repository_id" /><meta content="JuliaStats/Distributions.jl" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="6619192" name="octolytics-dimension-repository_network_root_id" /><meta content="JuliaStats/Distributions.jl" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/JuliaStats/Distributions.jl/commits/master.atom" rel="alternate" title="Recent Commits to Distributions.jl:master" type="application/atom+xml">

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
      <a class="button" href="/login?return_to=%2FJuliaStats%2FDistributions.jl%2Fblob%2Fmaster%2FREADME.md" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <form accept-charset="UTF-8" action="/JuliaStats/Distributions.jl/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/JuliaStats/Distributions.jl/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
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
      <a href="/login?return_to=%2FJuliaStats%2FDistributions.jl"
    class="minibutton with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/JuliaStats/Distributions.jl/watchers">
    31
  </a>


  </li>

  <li>
      <a href="/login?return_to=%2FJuliaStats%2FDistributions.jl"
    class="minibutton with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/JuliaStats/Distributions.jl/stargazers">
      84
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2FJuliaStats%2FDistributions.jl"
        class="minibutton with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>
      <a href="/JuliaStats/Distributions.jl/network" class="social-count">
        62
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/JuliaStats" class="url fn" itemprop="url" rel="author"><span itemprop="title">JuliaStats</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/JuliaStats/Distributions.jl" class="js-current-repository" data-pjax="#js-repo-pjax-container">Distributions.jl</a></strong>

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
     data-issue-count-url="/JuliaStats/Distributions.jl/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/JuliaStats/Distributions.jl" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /JuliaStats/Distributions.jl">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/JuliaStats/Distributions.jl/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /JuliaStats/Distributions.jl/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
      <a href="/JuliaStats/Distributions.jl/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /JuliaStats/Distributions.jl/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>


  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/JuliaStats/Distributions.jl/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /JuliaStats/Distributions.jl/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/JuliaStats/Distributions.jl/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /JuliaStats/Distributions.jl/graphs">
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
           value="https://github.com/JuliaStats/Distributions.jl.git" readonly="readonly">
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
           value="https://github.com/JuliaStats/Distributions.jl" readonly="readonly">
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



                <a href="/JuliaStats/Distributions.jl/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of JuliaStats/Distributions.jl as a zip file"
                   title="Download the contents of JuliaStats/Distributions.jl as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/JuliaStats/Distributions.jl/blob/bb1e2e3c228b72400e1a9db30080043fc7713189/README.md" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:366b227b4a9835e48e36e59b5165a7e3 -->

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


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/anj/beta/README.md"
                 data-name="anj/beta"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="anj/beta">anj/beta</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/binom-rand/README.md"
                 data-name="binom-rand"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="binom-rand">binom-rand</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/combinators/README.md"
                 data-name="combinators"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="combinators">combinators</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/db/Normal/README.md"
                 data-name="db/Normal"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="db/Normal">db/Normal</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/betaprime/README.md"
                 data-name="dh/betaprime"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/betaprime">dh/betaprime</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/conj2/README.md"
                 data-name="dh/conj2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/conj2">dh/conj2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/dirdmle/README.md"
                 data-name="dh/dirdmle"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/dirdmle">dh/dirdmle</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/doc3/README.md"
                 data-name="dh/doc3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/doc3">dh/doc3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/mixture2/README.md"
                 data-name="dh/mixture2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/mixture2">dh/mixture2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/mle2/README.md"
                 data-name="dh/mle2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/mle2">dh/mle2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/mvn2/README.md"
                 data-name="dh/mvn2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/mvn2">dh/mvn2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/mvnormal/README.md"
                 data-name="dh/mvnormal"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/mvnormal">dh/mvnormal</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/probs/README.md"
                 data-name="dh/probs"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/probs">dh/probs</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/readme2/README.md"
                 data-name="dh/readme2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/readme2">dh/readme2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/rtests/README.md"
                 data-name="dh/rtests"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/rtests">dh/rtests</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/sample/README.md"
                 data-name="dh/sample"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/sample">dh/sample</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/show2/README.md"
                 data-name="dh/show2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/show2">dh/show2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/support2/README.md"
                 data-name="dh/support2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/support2">dh/support2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/test3/README.md"
                 data-name="dh/test3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/test3">dh/test3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/trunc2/README.md"
                 data-name="dh/trunc2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/trunc2">dh/trunc2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/vmf2/README.md"
                 data-name="dh/vmf2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/vmf2">dh/vmf2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/vonmise2/README.md"
                 data-name="dh/vonmise2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/vonmise2">dh/vonmise2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/dh/wishart2/README.md"
                 data-name="dh/wishart2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="dh/wishart2">dh/wishart2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/gh-pages/README.md"
                 data-name="gh-pages"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="gh-pages">gh-pages</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/jmw/fit/README.md"
                 data-name="jmw/fit"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="jmw/fit">jmw/fit</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/jmw/lsf/README.md"
                 data-name="jmw/lsf"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="jmw/lsf">jmw/lsf</a>
            </div>
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/master/README.md"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/minmax/README.md"
                 data-name="minmax"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="minmax">minmax</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/rm-rmath/README.md"
                 data-name="rm-rmath"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="rm-rmath">rm-rmath</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/blob/travis_fix/README.md"
                 data-name="travis_fix"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="travis_fix">travis_fix</a>
            </div>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.6.3/README.md"
                 data-name="v0.6.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.6.3">v0.6.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.6.2/README.md"
                 data-name="v0.6.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.6.2">v0.6.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.6.1/README.md"
                 data-name="v0.6.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.6.1">v0.6.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.6.0/README.md"
                 data-name="v0.6.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.6.0">v0.6.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.15/README.md"
                 data-name="v0.5.15"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.15">v0.5.15</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.14/README.md"
                 data-name="v0.5.14"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.14">v0.5.14</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.13/README.md"
                 data-name="v0.5.13"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.13">v0.5.13</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.12/README.md"
                 data-name="v0.5.12"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.12">v0.5.12</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.11/README.md"
                 data-name="v0.5.11"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.11">v0.5.11</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.10/README.md"
                 data-name="v0.5.10"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.10">v0.5.10</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.9/README.md"
                 data-name="v0.5.9"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.9">v0.5.9</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.8/README.md"
                 data-name="v0.5.8"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.8">v0.5.8</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.7/README.md"
                 data-name="v0.5.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.7">v0.5.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.6/README.md"
                 data-name="v0.5.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.6">v0.5.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.5/README.md"
                 data-name="v0.5.5"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.5">v0.5.5</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.4/README.md"
                 data-name="v0.5.4"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.4">v0.5.4</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.3/README.md"
                 data-name="v0.5.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.3">v0.5.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.2/README.md"
                 data-name="v0.5.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.2">v0.5.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.1/README.md"
                 data-name="v0.5.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.1">v0.5.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.5.0/README.md"
                 data-name="v0.5.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.0">v0.5.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.11/README.md"
                 data-name="v0.4.11"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.11">v0.4.11</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.10/README.md"
                 data-name="v0.4.10"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.10">v0.4.10</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.9/README.md"
                 data-name="v0.4.9"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.9">v0.4.9</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.8/README.md"
                 data-name="v0.4.8"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.8">v0.4.8</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.7/README.md"
                 data-name="v0.4.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.7">v0.4.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.6/README.md"
                 data-name="v0.4.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.6">v0.4.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.5/README.md"
                 data-name="v0.4.5"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.5">v0.4.5</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.2/README.md"
                 data-name="v0.4.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.2">v0.4.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.1/README.md"
                 data-name="v0.4.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.1">v0.4.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.4.0/README.md"
                 data-name="v0.4.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.0">v0.4.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.3.3/README.md"
                 data-name="v0.3.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.3">v0.3.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.3.2/README.md"
                 data-name="v0.3.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.2">v0.3.2</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.3.1/README.md"
                 data-name="v0.3.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.1">v0.3.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.13/README.md"
                 data-name="v0.2.13"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.13">v0.2.13</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.12/README.md"
                 data-name="v0.2.12"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.12">v0.2.12</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.10/README.md"
                 data-name="v0.2.10"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.10">v0.2.10</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.9/README.md"
                 data-name="v0.2.9"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.9">v0.2.9</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.8/README.md"
                 data-name="v0.2.8"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.8">v0.2.8</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.7/README.md"
                 data-name="v0.2.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.7">v0.2.7</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/v0.2.6/README.md"
                 data-name="v0.2.6"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.2.6">v0.2.6</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/0.2.3/README.md"
                 data-name="0.2.3"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="0.2.3">0.2.3</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/JuliaStats/Distributions.jl/tree/0.2.2/README.md"
                 data-name="0.2.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="0.2.2">0.2.2</a>
            </div>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="button-group right">
    <a href="/JuliaStats/Distributions.jl/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/JuliaStats/Distributions.jl" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">Distributions.jl</span></a></span></span><span class="separator">/</span><strong class="final-path">README.md</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="Iain Dunning" class="avatar" data-user="692635" height="24" src="https://avatars2.githubusercontent.com/u/692635?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/IainNZ" rel="contributor">IainNZ</a></span>
        <time datetime="2014-09-13T16:09:02Z" is="relative-time">Sep 13, 2014</time>
        <div class="commit-title">
            <a href="/JuliaStats/Distributions.jl/commit/58984711b07fa36bc40cdcc1817f48999d44488c" class="message" data-pjax="true" title="Update PkgEval badge">Update PkgEval badge</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>6</strong>
           contributors
        </a>
      </p>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="lindahua" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=lindahua"><img alt="Dahua Lin" class="avatar" data-user="1900250" height="20" src="https://avatars0.githubusercontent.com/u/1900250?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="johnmyleswhite" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=johnmyleswhite"><img alt="John Myles White" class="avatar" data-user="22064" height="20" src="https://avatars1.githubusercontent.com/u/22064?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="IainNZ" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=IainNZ"><img alt="Iain Dunning" class="avatar" data-user="692635" height="20" src="https://avatars0.githubusercontent.com/u/692635?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="dmbates" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=dmbates"><img alt="Douglas Bates" class="avatar" data-user="371258" height="20" src="https://avatars1.githubusercontent.com/u/371258?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="danmerl" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=danmerl"><img alt="Dan Merl" class="avatar" data-user="3493568" height="20" src="https://avatars3.githubusercontent.com/u/3493568?v=3&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="aviks" href="/JuliaStats/Distributions.jl/commits/master/README.md?author=aviks"><img alt="Avik Sengupta" class="avatar" data-user="378918" height="20" src="https://avatars1.githubusercontent.com/u/378918?v=3&amp;s=40" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="Dahua Lin" data-user="1900250" height="24" src="https://avatars2.githubusercontent.com/u/1900250?v=3&amp;s=48" width="24" />
            <a href="/lindahua">lindahua</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="John Myles White" data-user="22064" height="24" src="https://avatars3.githubusercontent.com/u/22064?v=3&amp;s=48" width="24" />
            <a href="/johnmyleswhite">johnmyleswhite</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Iain Dunning" data-user="692635" height="24" src="https://avatars2.githubusercontent.com/u/692635?v=3&amp;s=48" width="24" />
            <a href="/IainNZ">IainNZ</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Douglas Bates" data-user="371258" height="24" src="https://avatars3.githubusercontent.com/u/371258?v=3&amp;s=48" width="24" />
            <a href="/dmbates">dmbates</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Dan Merl" data-user="3493568" height="24" src="https://avatars1.githubusercontent.com/u/3493568?v=3&amp;s=48" width="24" />
            <a href="/danmerl">danmerl</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Avik Sengupta" data-user="378918" height="24" src="https://avatars3.githubusercontent.com/u/378918?v=3&amp;s=48" width="24" />
            <a href="/aviks">aviks</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>22 lines (15 sloc)</span>
          <span class="meta-divider"></span>
        <span>1.147 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/JuliaStats/Distributions.jl/raw/master/README.md" class="minibutton " id="raw-url">Raw</a>
            <a href="/JuliaStats/Distributions.jl/blame/master/README.md" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/JuliaStats/Distributions.jl/commits/master/README.md" class="minibutton " rel="nofollow">History</a>
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
<a id="user-content-distributionsjl" class="anchor" href="#distributionsjl" aria-hidden="true"><span class="octicon octicon-link"></span></a>Distributions.jl</h1>

<p><a href="https://travis-ci.org/JuliaStats/Distributions.jl"><img src="https://camo.githubusercontent.com/3bbdef1335b8a3a23c5d30a9e484ee2e9cd64826/68747470733a2f2f7472617669732d63692e6f72672f4a756c696153746174732f446973747269627574696f6e732e6a6c2e7376673f6272616e63683d6d6173746572" alt="Build Status" data-canonical-src="https://travis-ci.org/JuliaStats/Distributions.jl.svg?branch=master" style="max-width:100%;"></a>
<a href="http://pkg.julialang.org/?pkg=Distributions&amp;ver=release"><img src="https://camo.githubusercontent.com/2924403399c8ae0232505b88ed1fd7febacff25e/687474703a2f2f706b672e6a756c69616c616e672e6f72672f6261646765732f446973747269627574696f6e735f72656c656173652e737667" alt="Distributions" data-canonical-src="http://pkg.julialang.org/badges/Distributions_release.svg" style="max-width:100%;"></a>
<a href="https://coveralls.io/r/JuliaStats/Distributions.jl?branch=master"><img src="https://camo.githubusercontent.com/36430c540caebff60b7806c45cdb4af2a9c12b11/68747470733a2f2f636f766572616c6c732e696f2f7265706f732f4a756c696153746174732f446973747269627574696f6e732e6a6c2f62616467652e706e673f6272616e63683d6d6173746572" alt="Coverage Status" data-canonical-src="https://coveralls.io/repos/JuliaStats/Distributions.jl/badge.png?branch=master" style="max-width:100%;"></a></p>

<p>A Julia package for probability distributions and associated functions. Particularly, Distributions implements:</p>

<ul class="task-list">
<li>Moments (e.g mean, variance, skewness, and kurtosis), entropy, and other properties</li>
<li>Probability density/mass functions (pdf) and their logarithm (logpdf)</li>
<li>Moment generating functions and characteristic functions</li>
<li>Sampling from population or from a distribution</li>
<li>Maximum likelihood estimation</li>
<li>Posterior w.r.t. conjugate prior, and Maximum-A-Posteriori (MAP) estimation</li>
</ul>

<h4>
<a id="user-content-resources" class="anchor" href="#resources" aria-hidden="true"><span class="octicon octicon-link"></span></a>Resources</h4>

<ul class="task-list">
<li>
<strong>Documentation</strong>: <a href="http://distributionsjl.readthedocs.org/en/latest/">http://distributionsjl.readthedocs.org/en/latest/</a>
</li>
<li>
<strong>Release Notes</strong>: <a href="https://github.com/JuliaStats/Distributions.jl/blob/master/NEWS.md">https://github.com/JuliaStats/Distributions.jl/blob/master/NEWS.md</a>
</li>
</ul>
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
      <li>&copy; 2015 <span title="0.03370s from github-fe116-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
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

