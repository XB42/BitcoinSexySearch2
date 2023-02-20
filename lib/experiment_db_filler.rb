require_relative 'apicaller.rb'
require 'sqlite3'

  DB = SQLite3::Database.new("../db/database.db")


    i = APICaller.get_max_height()
    p c = DB.execute("SELECT COUNT(*) FROM blocks")[0][0]
    while (c  < i)
      string = ''
      (c..i).each do |block|
        string += block.to_s
        string += ','
        puts string
      end
      string = string[0..-2]
      puts "----------------------------------------------------------------------------"
      puts string
      blockhash = APICaller.callAPI(string)
      blockhash.each do |block|
        puts block
        p "executing row #{block}"
        query = "INSERT INTO blocks (hash, height, prev_block, next_block, mrkl_root, tx_count, reward, fee, vout_sum, is_main, version, difficulty, size, bits, nonce, time) VALUES ('#{block["hash"]}', #{block["height"]}, '#{block["prev_block"]}', '#{block["next_block"]}', '#{block["mrkl_root"]}', #{block["tx_count"]}, #{block["reward"]}, #{block["fee"]}, #{block["vout_sum"]}, #{block["is_main"]}, #{block["version"]}, #{block["difficulty"]}, #{block["size"]}, #{block["bits"]}, #{block["nonce"]}, #{block["time"]});"
        rows = DB.execute(query)
      end
      c += 1
    end
