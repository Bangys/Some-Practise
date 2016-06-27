# coding: utf-8
#基本导入
from sys import exit
from random import randint

class Scene(object):

    def enter(self):
        print "这个场景尚未被配置，将其子类化并实施（执行）enter（）"
        exit(1)
        
        
class Engine(object):

    def __init__(self, scene_map):
        self.scene_map = scene_map
        
    def play(self):
        current_scene = self.scene_map.opening_scene()
        last_scene = self.scene_map.next_scene("finished")
        
        while current_scene != last_scene:
            next_scene_name = current_scene.enter()
            current_scene = self.scene_map.next_scene(next_scene_name)
            
        #确保输出最后一个场景
        current_scene.enter()

        
class Death(Scene):

    quips = [
        "你已经挂了，你可能不擅长这个",
        "你是人类的骄傲",
        "这么快就挂了 快读档！",
        "我有一只小狗能做的比你好"
    ]

    def enter(self):
        print Death.quips[randint(0, len(self.quips)-1)]
        exit(1)


class CentralCorridor(Scene):

    def enter(self):
        print "破靠#25号猩球的个哥顿人侵略了你的船并且消灭了"
        print "你的全体船员。 你是最后的幸存者"
        print "你最后的任务是从镭射武器库获得中子毁灭炸弹"
        print "把它安置在桥梁上炸毁它并且跑到逃生仓中"
        print "\n"
        print "你应该从中央走廊中跑下到达武器库"
        print "一个哥顿人跳了出来，长得好特么...(此处略去1000字)"
        print "它挡住了前往武器库的道路并且拿了枪射你"
        
        action = raw_input("你的动作是？\n1.射它\n2.躲避\n3.讲一个笑话\n")
        #1.射它 2.躲避 3.讲笑话
        if action == "1":
            print "你神速的掏枪并向它开火"
            print "它的身体附近出现不明防护罩，你的镭射枪击中它的衣服，但本体却没有事"
            print "这一击弄坏了它妈妈给它买的新衣服，它很愤怒并不断爆你的头"
            print "你死了，然后它把你吃了"
            return "death"
        elif action == "2":
            print "你的躲避像一个世界级拳击手一样，滑步，左滑右滑"
            print "当哥顿人扣动扳机，一道激光穿过你的头"
            print "在你滑步到一半时，你的头撞到了金属墙并昏过去"
            print "不久你就醒了，之后个哥顿人踩过你的头并吃了你"
            return "death"
            
        elif action == "3":
            print "幸运的它们让你在学院里学习哥顿式侮辱"
            print "你告诉一个哥顿人你所知道的笑话："
            print "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
            print "哥顿人停了下来，尝试忍住笑，但还是爆出笑声并不能行动"
            print "当它们笑的时候你跑上去向它们头上的正方形射击"
            print "放倒了它们，然后跳到兵器库的门口"
            return "laser_weapon_armory"
            
        else:
            print "吓傻了吧孩子，说人话！"
            return "central_corridor"
            
            
class LaserWeaponArmory(Scene):

    def enter(self):
        print "你一个前滚翻到了兵器库，为了防止更多的哥顿人你蹲伏着扫视了屋子"
        print "屋子里像死水般的安静，安静....。"
        print "你站起来跑到房间的另一边在柜子中发现了炸弹"            
        print "但有一个键盘板锁着柜子，你需要密码来打开它"
        print "如果你输入错误10次，那么箱子就会永远的锁住，你也就不会得到这单"        
        print "这个密码是三位数的。"
        code = "%d%d%d" %(randint(1,9), randint(1,9), randint(1,9))
        guess = raw_input("[键盘板：]")
        guesses = 1 
        while guess != code and guesses < 10:
            print "哔哔哔哔……"
            guesses += 1
            guess = raw_input("[键盘板：]")
            
        if guess == code:
            print "这个保险箱打开了，并且使密封气体放出"
            print "你紧握着中子炸弹并且以你最快的速度去"
            print "桥梁上，你必须把它安置在对的地方"
            return "the_bridge"
        else:
            print "箱子开始慢慢融化并放出刺鼻的气体"
            print "你瘫坐在那里，最后哥顿人毁灭了这艘船"
            print "你挂了老兄"
            return "death"
            
            
class TheBridge(Scene):
    def enter(self):
        print "你手臂下夹着炸弹突进桥梁"
        print "惊动了5个企图控制船舰的哥顿人"
        print "它们身上有比之前那个更丑的衣服" 
        print "它们没有拔出它们的武器，当它们看到你手臂下的炸弹，它们不希望它被放置"
        
        action = raw_input("你要怎么做？\n1.扔出炸弹\n2.慢慢的放置炸弹\n")
        
        if action == "1":
            print "在这紧急时刻你朝一堆哥顿人扔出了炸弹"
            print "然后你从门跳了出去"
            print "当你落下的那一刻一个哥顿人从背后射你一枪"
            print "当你要死的时候你看到了它们疯狂的尝试拆弹"
            print "你死了以后它们也被炸了个稀巴烂"
            return "death"
            
        elif action == "2":
            print "你瞄准着自己手臂下的炸弹"
            print "哥顿人开始紧张起来，它们把手举了起来"
            print "你谨慎的背对着门移动"
            print "然后小心翼翼的把炸弹安置在了楼梯中"
            print "并且瞄准它，你向后一跃"
            print "按下了关闭按钮把锁打坏，这样它们就出不去了"
            print "既然炸弹已经安置，你现在应该去逃生舱了"
            return "escape_pod"
        else:
            print "吓傻了吧孩子，说人话！"
            return "the_bridge"
            
            
class EscapePod(Scene):

    def enter(seld):
        print "在整艘船爆炸之前，你拼了老命了一顿跑，到了逃生舱"
        print "你不敢保证没有一个哥顿人还在船里，所以你的跑是对的"
        print "你到了逃生仓的一个大厅，你现在需要去打开其中一个"
        print "但是你没有时间去细看，这里有五个房间，你选择哪个？"

        good_pod = randint(1, 5)
        guess = raw_input("[你选择？]>>>\n")
        
        if int(guess) != good_pod:
            print "你跳进了第%s号，并且按了弹射按钮" % guess
            print "这个仓飞到了宇宙的空洞中，虚空撕碎了机体、你的身体变成了果冻"
            return "death"
        else:
            print "你跳进了第%s号，并且按了弹射按钮" % guess      
            print "机器启动，你慢慢的离开了这个是非之地"
            print "你回头看到了炸弹就像明亮的星星那样发光，结束了少年"
            print "你赢了，你成功拯救了世界"
        
            return "finished"
        
        
class Finished(Scene):

    def enter(self):
        print "You win! Good Job!"
        return "finished"
        
            
class Map(object):

    scenes = {
        'central_corridor': CentralCorridor(),
        'laser_weapon_armory': LaserWeaponArmory(),
        'the_bridge': TheBridge(),
        'escape_pod': EscapePod(),
        'death': Death(),
        'finished': Finished(),
        }        
    def __init__(self, start_scene):
        self.start_scene = start_scene
 
    def next_scene(self, scene_name):
        val = Map.scenes.get(scene_name)
        return val

    def opening_scene(self):
        return self.next_scene(self.start_scene)
        
a_map = Map("central_corridor")
a_game = Engine(a_map)
a_game.play()
        
            
            
            
            
            
          
