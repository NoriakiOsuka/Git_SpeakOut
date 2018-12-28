
[1mFrom:[0m /home/ec2-user/environment/speakout/app/controllers/crossfollows_controller.rb @ line 4 CrossfollowsController#create:

     [1;34m2[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m3[0m:   [32mif[0m ad_user_signed_in?
 =>  [1;34m4[0m:     binding.pry
     [1;34m5[0m:   @st_user = [1;34;4mStUser[0m.find(params[[33m:id[0m])
     [1;34m6[0m:   current_ad_user.stcrossfollow!(@st_user)
     [1;34m7[0m:   redirect_to @st_user
     [1;34m8[0m:   [32melsif[0m st_user_signed_in?
     [1;34m9[0m:   @ad_user = [1;34;4mAdUser[0m.find(params[[33m:crossfollow[0m][[33m:ad_user_id[0m])
    [1;34m10[0m:   current_st_user.adcrossfollow!(@ad_user)
    [1;34m11[0m:   redirect_to @ad_user
    [1;34m12[0m:   [32melse[0m
    [1;34m13[0m:   [32mend[0m
    [1;34m14[0m: [32mend[0m

