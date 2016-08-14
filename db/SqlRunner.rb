require('pg')

class SqlRunner

  def run(sql)
    begin
      db = PG.connect({dbname: 'MoneyCashBoard', host: 'localhost'})
      db.exec(sql)
    ensure
      db.close()
    end
    return result
  end

end