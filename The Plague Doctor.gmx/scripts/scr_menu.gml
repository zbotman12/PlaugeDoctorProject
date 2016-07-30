switch (mpos)
{
    case 0:
    {   
        if(file_exists(global.containerSavefname)){
            file_delete(global.containerSavefname);
        }
        room_goto(rm_newhospital);
        break;
    }
    case 1: 
        {
        if(file_exists(global.containerSavefname)){
            room_goto(rm_newhospital);
        }
        break;
        }
    case 2:
        {
         break;
        }
    case 3: game_end(); break;
    default: break;
}   
