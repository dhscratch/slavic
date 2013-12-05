#coding: utf-8
Допустим( /ꙇє примѣненъ модуль слово бисера рдоба/i ) do
   require 'slavic'
   Slavic.slovo
end

Если( /создаꙇе сѧ (наборъ|словникъ|папка|броиникъ|вв|весь|струга|окола|дводе)/ ) do |родъ|
   @выв, @вов = case родъ
   when 'наборъ'
      @исхъ, @плодъ = [ [ 1, 2, 4 ], [] ]
      [ @плодъ, @исхъ ]
   when 'словникъ' #TODO РЕЧНИК?
      @исхъ, @плодъ = [ { 1 => 'а', 2 => 'б', 4 => 'в' }, {} ]
      [ @плодъ, @исхъ ]
   when 'папка' #TODO ?
      @исхъ = []
      @плодъ = []
      Dir.new( './' ).each { |з| @исхъ << з }
      [ [], Dir.new( './' ) ]
   when 'броиникъ'
      @исхъ, @плодъ = [ [ 1, 2, 4 ], [] ]
      бр = Enumerator.new do |б|
         @исхъ.each do |з|
            б << з
            end ; end
      [ [ [ 1, 2, 4 ] ], бр ]
   when 'вв' #TODO ?? ыо, уо, ко, ку?
      @исхъ, @плодъ = [ 'страза', '' ]
      IO.pipe
   when 'весь' #TODO ??
      @исхъ, @плодъ = [ [ 1, 2, 3, 4 ], [] ]
      [ [], (1..4) ]
   when 'струга' #TODO??
      s = Struct.new( :'а', :'б', :'г' ).new( 1, 2, 4 )
      @исхъ, @плодъ = [ s.to_a, [] ]
      [ [], s ]
   when 'окола'
      @исхъ, @плодъ = [ ENV.to_a, [] ]
      [ [], ENV ]
   when 'дводе'
      @исхъ, @плодъ = [ ARGF.to_a, [] ]
      [ [], ARGF ]
   end ; end

Если( /вызоваꙇє сѧ :еже методъ рода (наборъ|словникъ|папка|броиникъ|вв|весь|струга|окола|дводе) за переброꙇениꙇе значене онагѡ/ ) do |родъ|
   @родъ = родъ
   case родъ
   when 'наборъ', 'папка', 'броиникъ', 'весь', 'струга', 'окола'
      @вов.еже { |з| @плодъ << з }
   when 'словникъ'
      @вов.еже { |к,з| @плодъ[ к ] = з }
   when 'вв'
      if fork
         @вов.close
         @выв.еже { |з| @плодъ << з }
         @выв.close
         Process.wait
      else
         @выв.close
         @вов << @исхъ
         @вов.close
         Process.exit!
      end
   when 'дводе'
      if RUBY_VERSION > '1.9.3'
         @вов.еже { |з| @плодъ << з } ; end
   end ; end

То( /зрѣмы, оже плодъ робли ꙇє подобающь/ ) do
   if @родъ == 'дводе' && RUBY_VERSION <= '1.9.3'
      next ; end

   if @исхъ != @плодъ
      raise "Плодовъ #{@родъ} держиꙇє ово: #{@плодъ.inspect}, але ово " \
            "требуꙇє: #{@исхъ.inspect}" ; end ; end

