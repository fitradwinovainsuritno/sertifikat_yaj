
<div class="col-md-6 grid-margin stretch-card" style="margin-top: 20px; margin-right: auto; margin-left: auto;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Login Sertifikat Online Admin</h4>
                  
                  <form action="<?= base_url('admin/Auth/login') ?>" method="post" class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputUsername1">Username</label>
                      <input type="text" name="username"class="form-control" id="exampleInputUsername1" placeholder="Username">
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password"class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                   
                    
                    <button type="submit" class="btn btn-primary me-2">Submit</button>
                    <button class="btn btn-light">Cancel</button>
                  </form>
                  <br>
                
                </div>
              </div>
            </div>