<?php 
include ("includes/header.php");
?>
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