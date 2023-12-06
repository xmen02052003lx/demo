<?php 
include ("includes/header.php");
?>
<h1 style="    margin-top: 0;
    margin-bottom: 1rem;
    font-weight: bold;
    line-height: 1.2;
    color: #191e47;   ">Contact us, we would love to hear from you</h1>
<form action="https://formspree.io/f/mgejdovv" method="POST">
              <div class="mb-3">
                <input
                  type="text"
                  name="name"
                  class="form-control"
                  placeholder="Enter name"
                />
              </div>
              <div class="mb-3">
                <input
                  type="email"
                  class="form-control"
                  placeholder="Enter email"
                  name="email"
                  required
                />
              </div>
              <div class="mb-3">
                <textarea
                  class="form-control"
                  placeholder="Enter message"
                  name="message"
                  rows="8"
                ></textarea>
                <div class="d-grid gap-2">
                  <input type="submit" value="Send" class="btn btn-primary" />
                </div>
              </div>
            </form>