import sqlalchemy as sa

metadata = sa.MetaData()

vote_results = sa.Table('voting', metadata,
    sa.Column('id', sa.Integer, primary_key=True),
    sa.Column('name', sa.Text),
    sa.Column('votes', sa.Integer)
)

def createConnection(dbname):
    ret_ = {}
    engine = sa.create_engine(dbname)    
    with engine.begin() as connection:
        select = vote_results.select()
        results = connection.execute(select)
        for _, name, votes in results.fetchall():
            ret_[name]=votes
    return ret_

def get_votes(dbname):
    ret_ = {}
    engine = sa.create_engine(dbname)    
    with engine.begin() as connection:
        select = vote_results.select()
        results = connection.execute(select)
        for _, name, votes in results.fetchall():
            ret_[name]=votes
    return ret_

def add_vote(dbname, species):
    ret_ = {}
    engine = sa.create_engine(dbname)    
    with engine.begin() as connection:
        select = vote_results.select().where(vote_results.c.name == species)
        results = connection.execute(select)
        id, _, votes = results.fetchone()

        new_votes = votes + 1
        update = (
            vote_results.update().values(votes=new_votes).where(vote_results.c.id == id)
        )
        connection.execute(update)
    return True

