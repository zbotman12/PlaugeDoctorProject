switch (mpos)
{
    case 0:
    {
        room_goto(rm_level1);
        break;
    }
    case 1: 
        {
        break;
        }
    case 2:
        {
         room_goto(rm_ass);
         break;
        }
    case 3:
        {
        break;
        }
    case 4: game_end(); break;
    default: break;
}   
