import psycopg2, random, string, time
from faker import Faker

fake = Faker()

c1 = (fake.company(), [0,0,0,0,1,1,1,6,8,7,0], [0,0,0,0,0,6,6,3,0])
c2 = (fake.company(), [5,15,15,15,16,16,16,16], [4,4,2,2,2,2,2])
c3 = (fake.company(), [2,2,10,3,3],[1,1])
c4 = (fake.company(), [4,9,11,12,18,18,12],[5,5])
c5 = (fake.company(), [13,14,14,19,13,14,17,17],[7,7])

clientList = [c1, c2, c3, c4, c5]

gameNameDic = {
    0: (fake.color_name(), 10),
    1: (fake.color_name(), 20),
    2: (fake.color_name(), 50),
    3: (fake.color_name(), 80),
    4: (fake.color_name(), 0),
    5: (fake.color_name(), 45),
    6: (fake.color_name(), 1),
    7: (fake.color_name(), 60)
}

venueNameDic = {
    0: (fake.street_name(), fake.country(), fake.city(), 2, 50),
    1: (fake.street_name(), fake.country(), fake.city(), 2, 20),
    2: (fake.street_name(), fake.country(), fake.city(), 10, 100),
    3: (fake.street_name(), fake.country(), fake.city(), 3, 400),
    4: (fake.street_name(), fake.country(), fake.city(), 20, 80),
    5: (fake.street_name(), fake.country(), fake.city(), 100, 1000),
    6: (fake.street_name(), fake.country(), fake.city(), 2, 30),
    7: (fake.street_name(), fake.country(), fake.city(), 1, 60),
    8: (fake.street_name(), fake.country(), fake.city(), 1, 50),
    9: (fake.street_name(), fake.country(), fake.city(), 1, 40),
    10: (fake.street_name(), fake.country(), fake.city(), 2, 70),
    11: (fake.street_name(), fake.country(), fake.city(), 1, 50),
    12: (fake.street_name(), fake.country(), fake.city(), 2, 50),
    13: (fake.street_name(), fake.country(), fake.city(), 10, 50),
    14: (fake.street_name(), fake.country(), fake.city(), 20, 50),
    15: (fake.street_name(), fake.country(), fake.city(), 23, 666),
    16: (fake.street_name(), fake.country(), fake.city(), 7, 777),
    17: (fake.street_name(), fake.country(), fake.city(), 1, 10),
    18: (fake.street_name(), fake.country(), fake.city(), 5, 20),
    19: (fake.street_name(), fake.country(), fake.city(), 4, 10),
}

devices = {
    0: 1000,
    1: 1000,
    2: 1000,
    3: 1000,
    4: 1000,
    5: 1000,
    6: 1000,
    7: 1001,
    8: 1001,
    9: 1001,
    10: 1001,
    11: 1001,
    12: 1001,
    13: 1001,
    14: 1001,
    15: 1002,
    16: 1002,
    17: 1002,
    18: 1002,
    19: 1003,
    20: 1003,
    21: 1004,
    22: 1002,
    23: 1004,
    24: 1005,
    25: 1006,
    26: 1006,
    27: 1007,
    28: 1008,
    29: 1009
}

clientNameDic = {
    0: c1,
    1: c1,
    2: c1,
    3: c1,
    4: c1,
    5: c1,
    6: c1,
    7: c1,
    8: c1,
    9: c1,
    10: c2,
    11: c2,
    12: c3, 
    13: c3,
    14: c3,
    15: c3,
    16: c4,
    17: c4,
    18: c4, 
    19: c4,
    20: c4,
    21: c4, 
    22: c1,
    23: c4, 
    24: c5,
    25: c5,
    26: c5,
    27: c5,
    28: c5,
    29: c5
}

def readyForTable(comp):
    string = comp
    string = ''.join(e for e in string if e.isalnum())
    return string.lower()

def randomword(length):
   return ''.join(random.choice(string.lowercase) for i in range(length))

def randomClient():
    v = random.randint(0,29)
    return clientNameDic.get(v)

def randomName(listGames):
    sup = len(listGames)
    v = random.randint(0,(sup-1))
    return gameNameDic.get(listGames[v])

def randomVenue(venueList):
    sup = len(venueList)
    v = random.randint(0,(sup-1))
    return venueNameDic.get(venueList[v])

def randomDevice(maxDic):
    v = random.randint(0,99)
    if v < maxDic:
        return devices.get(v)
    else:
        return random.randint(19999, 99999)

def initConnection(dbName, usr, password):
    return psycopg2.connect("dbname="+dbName+" user="+usr+" host=0.0.0.0 password=" + password)

def initCursor(connection):
    return connection.cursor()

def newGame(gId, country, cname, venue, town, deviceId, phoneType, gameName, won, amount, playedAt, ip, config, tableName, cursor):
    query1 = """INSERT INTO """+tableName
    query2 = """ (game_id, country, client_name, venue, town, device_id, phone_type, game_name, won, amount, played_at, ip, configuration_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
    query = query1+query2
    args = (gId, country, cname, venue, town, deviceId, phoneType, gameName, won, amount, playedAt, ip, config, )
    cursor.execute(query, args)

def getRandPhoneType():
    id = random.randint(0,1)
    if id == 0:
        return "ioS"
    else:
        return "android"

def playRandomGame(gId, cursor):
    client = randomClient()
    company = client[0]
    venueList = client[1]
    gameList = client[2]
    fullVenue = randomVenue(venueList)
    gameInfo = randomName(gameList)
    venue = fullVenue[0]
    country = fullVenue[1]
    town = fullVenue[2]
    minCart = fullVenue[3]
    maxCart = fullVenue[4]
    deviceId = randomDevice(29)
    game_name = gameInfo[0]
    won = fake.boolean(chance_of_getting_true=gameInfo[1])
    amount = random.randint(minCart,random.randint(minCart,maxCart))
    played_at = fake.date_time_between(start_date="-2y", end_date="now", tzinfo=None)
    ip = fake.ipv4(network=False)
    configId = random.randint(0,20)
    phoneType = getRandPhoneType()
    newGame(gId, country, company, venue, town, deviceId, phoneType, game_name, won, amount, played_at, ip, configId, "game", cursor)
    newGame(gId, country, company, venue, town, deviceId, phoneType, game_name, won, amount, played_at, ip, configId, readyForTable(company), cursor)

def initTables(cursor):
    query="""
    CREATE TABLE game (
        game_id INTEGER PRIMARY KEY,
        country VARCHAR(100) NOT NULL,
        client_name VARCHAR(100) NOT NULL,
        venue VARCHAR(100) NOT NULL,
        town VARCHAR(170) NOT NULL,
        device_id INTEGER NOT NULL,
        phone_type VARCHAR(10) NOT NULL,
        game_name VARCHAR(45) NOT NULL,
        won BOOLEAN NOT NULL DEFAULT false,
        amount BIGINT NOT NULL,
        played_at TIMESTAMP NOT NULL,
        ip VARCHAR(20) NOT NULL,
        configuration_id INTEGER NOT NULL
    )
        """

    for val in clientList:
        query+= """;
        CREATE TABLE """ +readyForTable(val[0])+""" (
            game_id INTEGER PRIMARY KEY,
            country VARCHAR(100) NOT NULL,
            client_name VARCHAR(100) NOT NULL,
            venue VARCHAR(100) NOT NULL,
            town VARCHAR(170) NOT NULL,
            device_id INTEGER NOT NULL,
            phone_type VARCHAR(10) NOT NULL,
            game_name VARCHAR(45) NOT NULL,
            won BOOLEAN NOT NULL DEFAULT false,
            amount BIGINT NOT NULL,
            played_at TIMESTAMP NOT NULL,
            ip VARCHAR(20) NOT NULL,
            configuration_id INTEGER NOT NULL
        )
        """
    try:
        cursor.execute(query)
    except:
        print "Nooooooooo ;'("
        cursor

def cleanTable(cur):
    try:
        cur.execute("SELECT table_schema,table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_schema,table_name")
        rows = cur.fetchall()
        for row in rows:
            print "dropping table: ", row[1]
            cur.execute("drop table " + row[1] + " cascade")
        cur.close()
    except:
        print "Error: ", sys.exc_info()[1]


def main():
    dbConnection= initConnection("postgres", "postgres", "password")
    cursor= initCursor(dbConnection)
    cur = initCursor(dbConnection)
    cleanTable(cur)
    initTables(cursor)
    dbConnection.commit()
    for i in range(0,9999999):
        try:
            playRandomGame(i, cursor)
            dbConnection.commit()
        except:
            continue
    while True:
        uin=input("Enter a game id:")
        playRandomGame(uin, cursor)
        time.sleep(.100)
        dbConnection.commit()
        uin=input("Continue ? [0/1]")
        if uin == 1:
            cursor.close()
            dbConnection.close()
            break

main()
