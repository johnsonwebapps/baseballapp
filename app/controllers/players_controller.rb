class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    
    @players = playersXML
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end
  
  # GET the batting average
  # NOT Currently using as lossing the float format in the view. 
  def battingaverage
    bats = @atbats.to_f
    hits = @hits.to_f
    if (bats > 0)
    @avg = (hits.to_f / bats)
    
    return @avg
  end
  end
  
 
  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

 

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET all the players from the xml document
  # TODO would probably re-factor this to the model
  def playersXML
    doc = Nokogiri::XML(File.open("/Users/chris/dev/baseballapp/1998statistics.xml"))
    
    @players = []
    doc.xpath('//PLAYER').map do |i| 
      # Data needed to determine batting average
      @atbats = i.xpath('AT_BATS').text
      @hits = i.xpath('HITS').text
      #calling the batting average method
      
      
      @player = Player.new
      @player.surname = i.xpath('SURNAME').text
      @player.givenname = i.xpath('GIVEN_NAME').text
      puts "THE AVG IS ^^^^^^^^^^^^^^^^^^^^ "
      @avg = battingaverage
      puts @avg
      @player.average = @avg
      @player.games = i.xpath('GAMES').text 
      @player.atbats = @atbats
      @player.runs = i.xpath('RUNS').text
      @player.hits = @hits
      @player.rbi = i.xpath('RBI').text
      @player.pb = i.xpath('PB').text
      @player.walks = i.xpath('WALKS').text
      @player.struckout = i.xpath('STRUCK_OUT').text
      @player.hitbypitch = i.xpath('HIT_BY_PITCH').text
      @players << @player
    end
    
    return @players
    
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
end
