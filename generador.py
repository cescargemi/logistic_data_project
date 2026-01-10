import pandas as pd
import random
from datetime import datetime
# Creem una llista per guardar les dades
dades = []

# Generem 10.000 línies
for i in range(10000):
    p_id = random.randint(1, 10)  # ID de producte (1 a 10)
    u_id = random.randint(1, 50)  # ID d'ubicació (1 a 50)
    qty = random.randint(1, 100)  # Quantitat
    tipus = random.choice(['IN', 'OUT'])
    
    # Introduïm "errors" a propòsit en algunes línies 💩
    if i % 20 == 0: # Cada 20 línies, posem una quantitat negativa
        qty = -qty
    if i % 50 == 0: # Cada 50 línies, posem un producte que no existeix
        p_id = 999
        
    dades.append([p_id, u_id, qty, tipus, datetime.now()])

# Ho convertim en un fitxer CSV
df = pd.DataFrame(dades, columns=['producte_id', 'ubicacio_id', 'quantitat', 'tipus_moviment', 'data_moviment'])
df.to_csv('moviments_bruts.csv', index=False)
print ('moviments_bruts.csv')
