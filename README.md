# URL-Shortener
This is is a framework for shortening long URLs into small URLs implemented in Ruby.

Steps: 
1. Need to install the Ruby Framework.
2. Need to install some gems (from cmd)
   $ gem install thin
   $ gem install puma
   $ gem install reel
   $ gem install http
   $ gem install webrick
3. Run the main_test.rb in cmd.
4. Make sure curl is present
5. Open another cmd to run --
   curl https://localhost:4567 --data "url=github.com" -X POST
   You can see the output(I also attached some ss in here)
6.Another way is via front-end html pages - (a)index.erb (b)result.erb
  (although i faced some problem doing that, so i commented it out. You can try it)
  
----------------------------------------------------------------------------------------------------------------------------------------
O/P ss--

![Image 1(github hackathon)](https://github.com/Sayam-000/URL-Shortener/assets/78695993/c600ca32-68ed-4f20-a018-178094de41a4)
..after reloading..
![Image 2(github hackathon)](https://github.com/Sayam-000/URL-Shortener/assets/78695993/a447ea8e-fc78-4c28-a214-8b71c99c3b73)
