

import de.bezier.guido.*;
public final static int NUM_ROWS = 20; 
public final static int NUM_COLS= 20; 
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>();//ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    
    buttons= new MSButton[NUM_ROWS][NUM_COLS];
    for(int rows = 0; rows<NUM_ROWS; rows ++)
        for(int cols = 0; cols<NUM_COLS; cols++)
            buttons[rows][cols] = new MSButton(rows,cols);


    
    setBombs();
}
public void setBombs()
{
    while(bombs.size() <20)
    {
   int row1 = (int)(Math.random()*20);
   int col1 = (int)(Math.random()*20);
   if(bombs.contains(buttons[row1][col1]) == false)
   {
    bombs.add(buttons[row1][col1]);
   }
    }
}



public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    for (int row = 0; row < NUM_ROWS; row ++)
    {
        for (int col = 0; col < NUM_COLS; col++)
        {
            if(!bombs.contains(buttons[row][col]) && buttons[row][col].isClicked() == false)
            {
                return false;
            }
        }
    }
    return true;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {if(mouseButton==LEFT && !buttons[r][c].isMarked())
        {
            clicked = true;
        }
        if(mouseButton==RIGHT && !buttons[r][c].isClicked())
        {
            marked = !marked;
        }
        else if(bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if(countBombs(r,c)>0)
        {
            setLabel(""+countBombs(r,c));
        }
        else 
        {
            if(isValid(r-1,c-1) && buttons[r-1][c-1].clicked == false)
            {
                buttons[r-1][c-1].mousePressed();
            }
            if(isValid(r-1,c) && buttons[r-1][c].clicked == false)
            {
                buttons[r-1][c].mousePressed();
            }
            if(isValid(r-1,c+1) && buttons[r-1][c+1].clicked == false)
            {
                buttons[r-1][c+1].mousePressed();
            }
            if(isValid(r,c-1) && buttons[r][c-1].clicked == false)
            {
                buttons[r][c-1].mousePressed();
            }
            if(isValid(r,c+1) && buttons[r][c+1].clicked == false)
            {
                buttons[r][c+1].mousePressed();
            }
            if(isValid(r+1,c-1) && buttons[r+1][c-1].clicked == false)
            {
                buttons[r+1][c-1].mousePressed();
            }
            if(isValid(r+1,c) && buttons[r+1][c].clicked == false)
            {
                buttons[r+1][c].mousePressed();
            }
            if(isValid(r+1,c+1) && buttons[r+1][c+1].clicked == false)
            {
                buttons[r+1][c+1].mousePressed();
            }
        }
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r>0 && r<NUM_ROWS&& c>0 && c<NUM_COLS)
        {
            return true; 
        }
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid == true(r,c-1)&& bombs.contains([r][c-1]))
            numBombs++;
        if(isValid == true(r,c+1)&& bombs.contains([r][c+1]))
            numBombs++;
        if(isValid == true(r+1,c)&& bombs.contains([r+1][c]))
            numBombs++;
        if(isValid == true(r-1,c)&& bombs.contains([r-1][c]))
            numBombs++;
        if(isValid == true(r-1,c-1)&& bombs.contains([r-1][c-1]))
            numBombs++;
        if(isValid == true(r-1,c+1)&& bombs.contains([r-1][c+1]))
            numBombs++;
        if(isValid == true(r+1,c-1)&& bombs.contains([r+1][c-1]))
            numBombs++;
        if(isValid == true(r+1,c+1)&& bombs.contains([r+1][c+1]))
            numBombs++;                                                            
        return numBombs;

    }
}



