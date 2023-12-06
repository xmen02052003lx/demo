$(document).ready(function () {
  $("#search_text_input").focus(function () {
    if (window.matchMedia("(min-width: 800px)").matches) {
      $(this).animate({ width: "250px" }, 500)
    }
  })

  $(".button_holder").on("click", function () {
    document.search_form.submit()
  })
  // Button for profile post
  $("#submit_profile_post").click(function () {
    $.ajax({
      type: "POST",
      url: "includes/handlers/ajax_submit_profile_post.php",
      data: $("form.profile_post").serialize(),
      success: function (msg) {
        $("#post_form").modal("hide")
        location.reload()
      },
      error: function () {
        alert("Failure")
      },
    })
  })
})

function getUsers(value, user) {
  $.post(
    "includes/handlers/ajax_friend_search.php",
    { query: value, userLoggedIn: user },
    function (data) {
      $(".results").html(data)
    }
  )
}

function getDropdownData(user, type) {
  if ($(".dropdown_data_window").css("height") == "0px") {
    let pageName
    if (type == "notification") {
    } else if (type == "message") {
      pageName = "ajax_load_messages.php"
      $("span").remove("#unread_message")
    }

    let ajaxreq = $.ajax({
      url: "includes/handlers/" + pageName,
      type: "POST",
      data: "page=1&userLoggedIn=" + user,
      cache: false,

      success: function (response) {
        $(".dropdown_data_window").html(response)
        $(".dropdown_data_window").css({
          padding: "0px",
          height: "200px",
          border: "1px solid #DADADA",
        })
        $("#dropdown_data_type").val(type)
      },
    })
  } else {
    $(".dropdown_data_window").html("")
    $(".dropdown_data_window").css({
      padding: "0px",
      height: "0px",
      border: "1px solid #DADADA",
    })
  }
}

function getLiveSearchUsers(value, user) {
  $.post(
    "includes/handlers/ajax_search.php",
    { query: value, userLoggedIn: user },
    function (data) {
      if ($(".search_results_footer_empty")[0]) {
        $(".search_results_footer_empty").toggleClass("search_results_footer")
        $(".search_results_footer_empty").toggleClass(
          "search_results_footer_empty"
        )
      }
      $(".search_results").html(data)
      $(".search_results_footer").html(
        "<a href='search.php?q=" + value + "'>See All Results</a>"
      )
      if ((data = "")) {
        $(".search_results_footer").html("")
        $(".search_results_footer").toggleClass("search_results_footer_empty")
        $(".search_results_footer").toggleClass("search_results_footer")
      }
    }
  )
}

function userScroll() {
  const navbar = document.querySelector(".navbar")
  const toTopBtn = document.querySelector("#to-top")

  window.addEventListener("scroll", () => {
    if (window.scrollY > 50) {
      navbar.classList.add("navbar-sticky")
      toTopBtn.classList.add("show")
    } else {
      navbar.classList.remove("navbar-sticky")
      toTopBtn.classList.remove("show")
    }
  })
}

function scrollToTop() {
  document.body.scrollTop = 0
  document.documentElement.scrollTop = 0
}

document.addEventListener("DOMContentLoaded", userScroll)
document.querySelector("#to-top").addEventListener("click", scrollToTop)
